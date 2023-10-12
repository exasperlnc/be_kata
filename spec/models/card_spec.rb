require 'rails_helper'

RSpec.describe Card do
  describe 'relationships' do
    it { should belong_to(:deck) }
    it { should belong_to(:user).through(:deck) }
  end
end