require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  # has n, :tags, through: Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text
  #It's Text and not String because String holds
  # only 50 characters by default
  # and it's not enough for the hash and salt

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
