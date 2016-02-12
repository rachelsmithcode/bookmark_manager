def create_links(url, title, tags)
  visit '/links/new'
  fill_in 'url', with: url
  fill_in 'title', with: title
  fill_in 'tags', with: tags
  click_button('Add')
end

def sign_up
  visit '/users/new'
  fill_in 'email', with: 'evil_kitty@dogslife.com'
  fill_in 'password', with: 'humanslavesrg8'
  fill_in 'password_confirmation', with: 'humanslavesrg8'
  click_button('Sign up!')
end

def sign_up_bad_pw
  visit '/users/new'
  fill_in 'email', with: 'evil_kitty@dogslife.com'
  fill_in 'password', with: 'humanslavesrg8'
  fill_in 'password_confirmation', with: 'ilovehumans'
  click_button('Sign up!')
end

def sign_up_bad(email)
  visit '/users/new'
  fill_in 'email', with: (email)
  fill_in 'password', with: 'humanslavesrg8'
  fill_in 'password_confirmation', with: 'ilovehumans'
  click_button('Sign up!')
end

def sign_in
  visit '/sessions/new'
  fill_in 'email', with: 'evil_kitty@dogslife.com'
  fill_in 'password', with: 'humanslavesrg8'
  click_button 'Login!'
end

def sign_in_bad_pw
  visit '/sessions/new'
  fill_in 'email', with: 'evil_kitty@dogslife.com'
  fill_in 'password', with: 'ilovehumans'
  click_button 'Login!'
end

def sign_in_bad_email
  visit '/sessions/new'
  fill_in 'email', with: 'good_dog@catspaw.com'
  fill_in 'password', with: 'humanslavesrg8'
  click_button 'Login!'
end
