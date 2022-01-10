require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'new' do
    it 'validates user nil' do
      user = User.new
      expect(user).to_not be_valid
    end

    it 'validates user email present' do
      user = User.new(password: 'test_pass')
      expect(user).to_not be_valid
    end

    it 'validates user password present' do
      user = User.new(email: 'jondoe@test.com')
      expect(user).to_not be_valid
    end

    it 'valid user credentials' do
      user = User.new(email: 'jondoe@test.com', password: 'test_pass')
      expect(user).to be_valid
    end
  end
end
