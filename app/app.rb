require 'sinatra/base'
require './app/models/user.rb'
require './app/models/link.rb'
require './app/models/link_list.rb'
require 'tilt/erb'

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
    @user.link_list.get_info
    erb(:user)
  end

  post '/new_link' do
    $user.link_list.activation
    Link.create(url: params[:url], title: params[:title])
    redirect '/user'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
