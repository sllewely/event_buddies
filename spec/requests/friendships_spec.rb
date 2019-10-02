require 'rails_helper'

RSpec.describe 'Friendships Responses API', type: :request do
  let(:user) { create :user }
  let(:user2) { create :user, first_name: 'Jim', last_name: 'Campagno' }

  before do
    sign_in user
  end

  describe 'GET /friendships/' do

    it 'gets all of my friends' do
      friendship_request = FriendshipRequest.create!(requesting_friend: user2, pending_friend: user)
      friendship_request.accept!

      get '/api/v1/friendships', as: :json

      expect(result.size).to eq(1)
      expect(result.first['first_name']).to eq(user2.first_name)
    end

    it 'returns empty array if user has no friends' do
      get '/api/v1/friendships', as: :json

      expect(result.size).to eq(0)
    end
  end
end
