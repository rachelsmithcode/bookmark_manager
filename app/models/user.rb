require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  # has n, :tags, through: Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text
  attr_reader :password
  attr_accessor :password_confirmation

  #It's Text and not String because String holds
  # only 50 characters by default
  # and it's not enough for the hash and salt
  validates_confirmation_of :password

  #validates_format_of :email, as :email_addresss

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
