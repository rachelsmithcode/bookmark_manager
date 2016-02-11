def create_links(url, title, tags)
  visit '/links/new'
  fill_in 'url', with: url
  fill_in 'title', with: title
  fill_in 'tags', with: tags
  click_button('Add')
end

def sign_up
  visit '/users/new'
  fill_in 'email', with: 'kitty_cat@dogslife.com'
  fill_in 'password', with: 'humanslavesrg8'
  click_button('Sign up!')
end
