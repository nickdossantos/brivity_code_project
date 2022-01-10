require 'rails_helper'

RSpec.describe '/authors', type: :request do
  fixtures :authors
  describe 'GET /show' do
    it 'displays author show page' do
      get author_url(authors(:one))
      expect(response).to be_successful
    end
  end
end
