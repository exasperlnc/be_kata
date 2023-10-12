require 'rails_helper'

describe User do
  let(:users) { create_list(:user, 3) }
  let(:user1) { users.first }
  describe 'relationships' do
    it {should have_secure_password }
    it {should have_many(:decks) }
  end
  it 'exists' do
    expect(user1).to be_a(User)
  end

  it 'has attributes' do
    users.each do |user|
      expect(user.f_name).to_not eq(nil)
      expect(user.l_name).to_not eq(nil)
      expect(user.email).to_not eq(nil)
      expect(user.password_digest).to_not eq(nil)
    end
  end

end