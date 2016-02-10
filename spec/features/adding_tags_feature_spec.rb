require 'spec_helper'
require './app/app.rb'


feature 'Adding tags' do

  scenario 'Adding a tag' do

    visit '/links/new'
    fill_in 'url', with: 'www.wordpress.com'
    fill_in 'title', with: 'Wordpress'
    fill_in 'tag', with: 'blog'
    click_button('Add')

    expect(current_path).to eq '/links'


    within 'ul#links' do
      expect(page).to have_text('blog')
    end

  end


end
