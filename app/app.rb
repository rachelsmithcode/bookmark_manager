require 'sinatra/base'
# require 'rack'
require_relative 'models/links'

class BookmarkManager < Sinatra::Base
  set :sessions, true

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  run! if app_file == $0
end
