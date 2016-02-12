feature 'signing in' do

  before do
    sign_up
  end

  scenario 'A user can sign in with valid credentials' do
    sign_in
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome, evil_kitty@dogslife.com'
  end

  scenario 'A user cannot sign in with invalid password' do
    sign_in_bad_pw
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The email or password is incorrect Login E-mail Password'
  end

  scenario 'A user cannot sign in with invalid email' do
    sign_in_bad_email
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The email or password is incorrect Login E-mail Password'
  end
end
