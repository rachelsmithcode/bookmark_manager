require 'spec_helper.rb'
require 'web_helper.rb'


#USER STORY ONE
# As a Makers Student
# So that I can see what other people like
# I want to see a list of popular links on the homepage before login.

feature "display title page" do
  scenario "it shows a list of popular links on the home page" do
    visit "/"
    expect(page).to have_content("Bookmarker-Pen")
  end

  # scenario "shows popular links" do
  #   visit "/"
  #   expect(page).to have_content("google")
  # end

  scenario "to have a login button" do
    visit "/"
    expect(page).to have_button("Login")
  end

end

feature "redirects to user homepage" do
  scenario "it shows the user name on thier home page" do
    sign_in
    expect(page).to have_content("Moses Links")
  end

  scenario "to have a login button" do
    Link.create(URL: 'https://en-gb.facebook.com/', title: 'Facebook')
    sign_in
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Facebook')
    end
  end

end
