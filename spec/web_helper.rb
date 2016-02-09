def sign_in
  visit "/"
  fill_in :user, with: 'Moses'
  click_button("Login")
end
