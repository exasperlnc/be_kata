require 'rails_helper'

RSpec.describe Deck do
  describe 'relationships' do
    it { should belong_to(:user) }
  end
end