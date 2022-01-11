require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/posts', type: :request do
  fixtures :all

  describe 'GET /index' do
    it 'renders a successful response' do
      get posts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get post_url(posts(:one))
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      author = authors(:one)
      login_as(author)
      get new_author_post_url(author.id), params: { id: author.id }, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      author = authors(:one)
      login_as(author)
      get new_author_post_url(author.id), params: { id: author.id }, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Post' do
        author = authors(:one)
        login_as(author)
        expect do
          post author_posts_url(author.id), params: { post: { user_id: author.id, title: 'test', body: 'test body' } },
                                            xhr: true
        end.to change(Post, :count).by(1)
      end
    end
  end
end
