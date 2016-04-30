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
    @issues = Issue.all
    erb :issues
  end


end