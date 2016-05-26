require 'pry'
class App < Sinatra::Base
  enable :sessions

  before do
    @user = User.get session[:user_id] if session[:user_id]
  end

  get '/' do
    if session[:user_id]
      redirect 'issues'
    end
  	erb :start, layout: false
  end

  get '/login-page' do
    if session[:user_id]
      redirect 'issues'
    end
    erb :loginsite, layout:false
  end

  post '/login' do
    user = User.first(mail: params["mail"])
    if user && user.password == params["password"]
      session[:user_id] = user.id
      redirect 'issues'
    end
    redirect '/login-page'
  end

  get '/logout/?' do
    session.destroy
    redirect '/'
  end

  get '/issues' do
    @issues = @user.issues
    @allissues = Issue.all
    @categories = Category.all
    @messages = Message.all
    @user
    @issueattachments = IssueAttachment.all
    erb :issues
  end

  get '/common-problems' do
    @user = User.first(id:session[:user_id])
    @problems = KnowledgeBaseArticle.all
    erb :common_problems
  end

  get '/new-issue' do
    @user = User.first(id:session[:user_id])
    @categories = Category.all
    puts @categories
    erb :new_issue
  end

  post '/create-new-issue' do
    issue = Issue.create(name: params["subject"],
                  description: params["description"],
                  category_id: params["category"],
                  status_id: 3)

    UserIssue.create(user_id: session[:user_id],
                     issue_id: issue.id)

    if params[:attachments] != nil
      files = params[:attachments]
      files.each do |file|

        original_name = file[:filename]
        tmpfile = file[:tempfile]

        # filetype = filename[:type].split('/')[1] #file[:type] always looks like image/*type*


        new_name = (0...30).map { ('a'..'z').to_a[rand(26)] }.join #Creates a random string with 30 letters

        extname = File.extname(file[:filename])

        File.open("./public/uploads/#{new_name}.#{extname}", "w+") do |f|
          f.write(tmpfile.read)
        end

        IssueAttachment.create(path: "#{new_name}.#{extname}", name: original_name, issue_id: issue.id)
      end
    end

    redirect '/issues'

  end

  get '/issue/:id' do |id|
    @issue = Issue.first(id: id)
    @users = @issue.users
    @messages = Message.all
    erb :issue
  end

  post '/send-message' do

    Message.create(message: params["message"],
                    user_id: session[:user_id],
                    issue_id: params["id"])

    redirect '/'

  end

  post '/send-message/:id' do |id|

    Message.create(message: params["message"],
                   user_id: session[:user_id],
                   issue_id: params["id"])

    redirect "/issue/#{id}"

  end

  post '/assign/:id' do |id|
    UserIssue.create(user_id: session[:user_id],
                      issue_id: id)

    issue = Issue.get(id)
    issue.update(status_id: 1)

    redirect "/issue/#{id}"
  end

  post '/close/:id' do |id|

    issue = Issue.get(id)
    issue.update(status_id: 2)

    redirect "/issue/#{id}"

  end



end