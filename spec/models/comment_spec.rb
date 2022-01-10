require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'new' do
    it 'validates body' do
      comment = Comment.new
      expect(comment).to_not be_valid
    end

    it 'validates missing associations' do
      comment = Comment.new(body: 'test')
      expect(comment).to_not be_valid
    end

    it 'validates missing post' do
      comment = Comment.new(body: 'test', user_id: 1)
      expect(comment).to_not be_valid
    end

    it 'validates missing user' do
      comment = Comment.new(body: 'test', post_id: 1)
      expect(comment).to_not be_valid
    end

    it 'is valid' do
      comment = Comment.new(body: 'test', user_id: 1, post_id: 1)
      expect(comment).to be_valid
    end
  end
end
