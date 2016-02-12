require 'spec_helper'
require './app/app.rb'

feature 'Signing up and user accounts' do

  scenario 'Sign up as a new user' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, evil_kitty@dogslife.com')
    expect(User.first.email).to eq("evil_kitty@dogslife.com")
  end

  scenario 'user not created when password does not match' do
    expect{sign_up_bad_pw}.to change(User, :count).by(0)
    expect(page).not_to have_content('Welcome, evil_kitty@dogslife.com')
  end

  scenario 'error message shown on same page when password does not match' do
    sign_up_bad_pw
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'new user cannot sign up with blank email address' do
    expect{sign_up_bad('')}.not_to change(User, :count)
    sign_up_bad('')
    expect(page).to have_content('Email must not be blank')

  end

  scenario 'new user cannot sign up with invalid email address' do
    expect{sign_up_bad('i am not an email')}.to change(User, :count).by(0)
    sign_up_bad('i am not an email')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'new user cannot sign up with an email address that has already been registered' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
