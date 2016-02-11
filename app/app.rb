ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class BookmarkManager < Sinatra::Base
  set :sessions, true

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
    redirect '/links'
  end

  run! if app_file == $0
end
