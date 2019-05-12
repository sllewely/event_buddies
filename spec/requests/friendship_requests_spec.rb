require 'rails_helper'

RSpec.describe 'Friendship Requests Responses API', type: :request do
  let(:user) { create :user }
  let(:user2) { create :user, first_name: 'Jim' }

  before do
    sign_in user
  end

  describe 'POST /friendship_requests/' do
    xit 'creates a new friendship request with the given user' do
      post "/api/v1/friendship_requests", params: { format: :json }
    end
  end

  describe 'GET /friendship_requests/' do
    xit 'gets all pending friendship requests' do
      get '/api/v1/friendship_requests', params: { format: :json }
    end
  end

  describe 'POST /friendship_requests/:uuid/confrim' do
    xit 'accepts the given friendship request and creates a friendship relation' do
      post "/api/v1/friendship_requests/#{user2.id}/confirm"
    end
  end

  describe 'POST /friendship_requests/:uuid/reject' do
    xit 'rejects the given friendship request' do
      post "/api/v1/friendship_requests/#{user2.id}/reject"
    end
  end
end
