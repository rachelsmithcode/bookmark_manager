require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :page, String
  property :url, String
  property :tag, String

  attr_reader :name

  def initialize(name)
    @name = name
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, "postgres://localhost/users")
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

  def create_table

  end

  def access_table
  end

  def add_link
  end

  def delete_link
  end



end
