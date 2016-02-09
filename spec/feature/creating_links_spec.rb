require 'spec_helper'
require 'web_helper'

feature 'save links to the database' do
  scenario 'save upon input of data' do
    sign_in
    expect(page).to have_button 'add'
  end

  scenario 'adds the information to bookmark list' do
    sign_in
    fill_in :title, with: 'Facebook'
    fill_in :url, with: 'https://www.facebook.com/'
    click_button 'add'
    expect(page).to have_content 'Facebook'
    expect(page).to have_content 'https://www.facebook.com/'
  end
end
