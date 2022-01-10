require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'new' do
    it 'validates author nil' do
      author = Author.new
      expect(author).to_not be_valid
    end

    it 'validates missing first_name' do
      author = Author.new(last_name: 'doe')
      expect(author).to_not be_valid
    end

    it 'validates full name' do
      author = Author.new(first_name: 'jon', last_name: 'doe')
      expect(author.full_name).to eq('jon doe')
    end
  end
end
