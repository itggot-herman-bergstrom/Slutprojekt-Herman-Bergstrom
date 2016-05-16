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

    issue

    UserIssue.create(user_id: session[:user_id],
                     issue_id: issue.id)

    redirect '/issues'

  end

end