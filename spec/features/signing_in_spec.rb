feature 'signing in' do

  before do
    sign_up
  end

  scenario 'A user can sign in with valid credentials' do
    visit '/sessions/new'
    fill_in 'email', with: 'evil_kitty@dogslife.com'
    fill_in 'password', with: 'humanslavesrg8'
    click_button 'Login!'
    expect(current_path).to eq '/links'
    expect(page). to have_content 'Welcome, evil_kitty@dogslife.com'
  end

  scenario 'A user cannot sign in with invalid password' do
    visit '/sessions/new'
    fill_in 'email', with: 'evil_kitty@dogslife.com'
    fill_in 'password', with: 'ilovehumans'
    click_button 'Login!'
    expect(current_path).to eq '/sessions'
    expect(page). to have_content 'The email or password is incorrect Login E-mail Password'
  end

  scenario 'A user cannot sign in with invalid email' do
    visit '/sessions/new'
    fill_in 'email', with: 'good_kitty@dogslife.com'
    fill_in 'password', with: 'humanslavesrg8'
    click_button 'Login!'
    expect(current_path).to eq '/sessions'
    expect(page). to have_content 'The email or password is incorrect Login E-mail Password'
  end
end
