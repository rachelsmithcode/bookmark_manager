feature 'signing out' do

  before do
    sign_up
  end

  scenario 'A user can sign out after signing in' do
    sign_in
    click_button"Sign out"
    expect(page).to have_content 'goodbye!'
    expect(page).not_to have_content 'Welcome, evil_kitty@dogslife.com'
  end

end
