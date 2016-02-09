require 'sinatra/base'

class Bookmark < Sinatra::Base
  get '/' do
    erb(:home)
  end

  post '/login' do
    redirect '/user'
  end

  get '/user' do
    erb(:user)
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
