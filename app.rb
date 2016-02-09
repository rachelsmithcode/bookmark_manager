require 'sinatra/base'

class Bookmark < Sinatra::Base
  get '/' do
    erb(:home)
  end

  post '/login' do
    $user = User.new(params[:user])
    redirect '/user'
  end

  get '/user' do
    @user = $user
    erb(:user)
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
