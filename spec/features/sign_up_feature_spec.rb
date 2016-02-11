require 'spec_helper'
require './app/app.rb'

feature 'Signing up and user accounts' do

  scenario 'Sign up as a new user' do

    expect{sign_up}.to change(User, :count).by(1)

  end
  #
  # scenario 'Adding multiple tags' do
  #
  #   create_links('www.wordpress.com', 'Wordpress', 'blog cat funny')
  #   link = Link.first
  #   expect(link.tags.map(&:name)).to include('blog', 'cat', 'funny')
  #
  # end


end
