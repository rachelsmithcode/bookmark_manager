ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    array = (params[:tags]).split(' ')
    array.each do |t|
      link.tags << Tag.create(name: t)
    end
    link.save
    redirect '/links'
  end

  post '/links/:name' do
    tag = Tag.all(name: params[:search_tag])
    @links = tag ? tag.links : []
    # redirect '/links'
    erb :'links/index'
   end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

  run! if app_file == $0
end
