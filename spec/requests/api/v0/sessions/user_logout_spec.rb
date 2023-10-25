require 'rails_helper'

RSpec.describe 'logout request' do
  let!(:users) { create_list(:user, 1) }
  let!(:user1) { users.first }
  it 'happy path' do
    post api_v0_login_path, params: { session: { email: user1.email, password: user1.password }} 

    expect(session[:user_id]).to_not eq(nil)
    
    delete api_v0_logout_path 

    expect(session[:user_id]).to eq(nil)
  end

  it 'sad path' do
    delete api_v0_logout_path 
    expect(session[:user_id]).to eq(nil)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:error)
    expect(data[:error]).to eq("User was not logged in")

  end
end