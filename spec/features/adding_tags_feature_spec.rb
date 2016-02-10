require 'spec_helper'
require './app/app.rb'

feature 'Adding tags' do

  scenario 'Adding a tag' do

    create_links('www.wordpress.com', 'Wordpress', 'blog')
    link = Link.first
    expect(link.tags.map(&:name)).to include('blog')

  end

end
