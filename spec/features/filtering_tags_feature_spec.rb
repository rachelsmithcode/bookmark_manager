require 'spec_helper'
require './app/app.rb'


feature 'Filtering and viewing tags' do

  scenario 'filtering links with certain tags' do

    create_links('www.wordpress.com', 'Wordpress', 'blog')
    create_links('www.facebook.com', 'Facebook', 'bubble')

    visit '/links'

    link = Link.first
    expect(link.tags.map(&:name)).to include('bubble')

  end

end
