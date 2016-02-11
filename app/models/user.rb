require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  # has n, :tags, through: Resource

  property :id, Serial
  property :email, String
  property :password, String

  # :user_count

end
