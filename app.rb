class App < Sinatra::Base
  enable :sessions

  get '/' do
    @users = User.all
  	erb :start
  end

  get '/issues' do
    @issues = Issue.all
    erb :issues
  end


end