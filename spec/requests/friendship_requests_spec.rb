require 'rails_helper'

RSpec.describe 'Friendship Requests Responses API', type: :request do
  let(:user) { create :user }
  let(:user2) { create :user, first_name: 'Jim' }

  before do
    sign_in user
  end

  describe 'POST /friendship_requests/' do
    it 'creates a new friendship request with the given user' do
      post "/api/v1/friendship_requests", params: { pending_friend_id: user2.id }, as: :json

      expect(response.status).to eq(200)

      friendship_request = FriendshipRequest.first
      expect(friendship_request.requesting_friend_id).to eq(user.id)
      expect(friendship_request.pending_friend_id).to eq(user2.id)

      # verify requesting friend associations
      expect(user.pending_friends).to eq([user2])
      expect(user.pending_friendship_requests).to eq([friendship_request])
      expect(user.requesting_friends).to eq([])
      expect(user.requesting_friendship_requests).to eq([])

      # verify pending (receiving) friend associations
      expect(user2.pending_friends).to eq([])
      expect(user2.pending_friendship_requests).to eq([])
      expect(user2.requesting_friends).to eq([user])
      expect(user2.requesting_friendship_requests).to eq([friendship_request])
    end

    it 'cannot create duplicate friendship requests for the same person' do
      post "/api/v1/friendship_requests", params: { pending_friend_id: user2.id }, as: :json

      expect(response.status).to eq(200)

      expect { post "/api/v1/friendship_requests", params: { pending_friend_id: user2.id }, as: :json }
          .to raise_error(ActiveRecord::RecordNotUnique)
    end
  end

  describe 'GET /friendship_requests/' do
    it 'gets all pending friendship requests' do
      FriendshipRequest.create(requesting_friend: user2, pending_friend: user)

      get '/api/v1/friendship_requests', as: :json

      expect(result.first['requesting_friend']["id"]).to eq(user2.id)
      expect(result.first['requesting_friend']["first_name"]).to eq(user2.first_name)
      expect(result.first['requesting_friend']["last_name"]).to eq(user2.last_name)
    end
  end

  describe 'POST /friendship_requests/:id/confirm' do
    it 'accepts the given friendship request and creates a friendship relation' do
      friendship_request = FriendshipRequest.create!(requesting_friend: user2, pending_friend: user)

      post "/api/v1/friendship_requests/#{friendship_request.id}/confirm"

      expect(response.status).to eq(200)
      expect(user.friends).to eq([user2])
      expect(user2.friends).to eq([user])

      expect(FriendshipRequest.all.size).to eq(0)
    end
  end

  describe 'POST /friendship_requests/:id/reject' do
    it 'rejects the given friendship request' do
      friendship_request = FriendshipRequest.create!(requesting_friend: user2, pending_friend: user)
      expect(user.requesting_friends).to include(user2)

      post "/api/v1/friendship_requests/#{friendship_request.id}/reject"

      expect(response.status).to eq(200)
      expect(user.requesting_friends).to_not include(user2)
    end

    it 'only allows you to reject your incoming friendship requests' do
      friendship_request = FriendshipRequest.create!(requesting_friend: user, pending_friend: user2)

      post "/api/v1/friendship_requests/#{friendship_request.id}/reject"

      expect(response.status).to eq(404)
      expect(user2.requesting_friends).to include(user)
    end
  end

end
