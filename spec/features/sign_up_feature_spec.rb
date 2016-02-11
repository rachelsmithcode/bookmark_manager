require 'spec_helper'
require './app/app.rb'

feature 'Signing up and user accounts' do

  scenario 'Sign up as a new user' do

    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, evil_kitty@dogslife.com')
    expect(User.first.email).to eq("evil_kitty@dogslife.com")

  end

  scenario 'user not created when password does not match' do

    expect{sign_up_bad}.to change(User, :count).by(0)
    expect(page).not_to have_content('Welcome, evil_kitty@dogslife.com')

  end

end
