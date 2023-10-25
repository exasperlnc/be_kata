require 'rails_helper'

RSpec.describe 'login request' do
  let!(:users) { create_list(:user, 1) }
  let!(:user1) { users.first }
  it 'happy path' do
    post api_v0_login_path, params: { session: { email: user1.email, password: user1.password }} 
    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(session).to have_key(:user_id)
    expect(session[:user_id]).to eq(user1.id)

    expect(data).to have_key(:f_name) 
    expect(data[:f_name]).to be_a(String) 

    expect(data).to have_key(:l_name) 
    expect(data[:l_name]).to be_a(String) 

    expect(data).to have_key(:email) 
    expect(data[:email]).to be_a(String) 
    expect(data).to have_key(:password_digest) 
    expect(data[:password_digest]).to be_a(String) 
  end

  it 'sad path' do
    post api_v0_login_path, params: { session: { email: "incorrect@email.com", password: "not a password" }} 
    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data).to have_key(:error)
    expect(data[:error]).to eq("Invalid Credentials")

    expect(session[:user_id]).to eq(nil)
  end
end