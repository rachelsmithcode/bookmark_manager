require 'data_mapper'
require 'dm-postgres-adapter'

class User
  attr_reader :link_list

  attr_reader :name

  def initialize(name, link_list = LinkList.new)
    @name = name
    @link_list = link_list
  end

  # def create_table
  #
  # end
  #
  # def access_table
  # end
  #
  # def add_link
  # end
  #
  # def delete_link
  # end



end
