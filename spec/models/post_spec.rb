require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'new' do
    it 'validates body' do
      post = Post.new
      expect(post).to_not be_valid
    end

    it 'validates missing associations' do
      post = Post.new(title: 'test', body: 'test')
      expect(post).to_not be_valid
    end

    it 'validates missing title' do
      post = Post.new(body: 'test', user_id: 1)
      expect(post).to_not be_valid
    end

    it 'validates missing body' do
      post = Post.new(title: 'test', user_id: 1)
      expect(post).to_not be_valid
    end

    it 'validates missing user' do
      post = Post.new(title: 'test', body: 'test')
      expect(post).to_not be_valid
    end

    it 'is valid' do
      post = Post.new(title: 'test', body: 'test', user_id: 1)
      expect(post).to be_valid
    end
  end
end
