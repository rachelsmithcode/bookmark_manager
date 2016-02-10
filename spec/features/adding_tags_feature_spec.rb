require 'spec_helper'
require './app/app.rb'


feature 'Adding tags' do

  scenario 'Adding a tag' do

    visit '/links/new'
    fill_in 'url', with: 'www.wordpress.com'
    fill_in 'title', with: 'Wordpress'
    fill_in 'tags', with: 'blog'
    click_button('Add')
    
    link = Link.first
    expect(link.tags.map(&:name)).to include('blog')

  end

end
