require 'rails_helper'

RSpec.describe 'Friendship Requests Responses API', type: :request do
  let(:user) { create :user }
  let(:user2) { create :user, first_name: 'Jim' }

  describe 'POST /friendship_requests/' do

    before do
      sign_in user
    end

    it 'creates a new friendship request with the given user' do
      post "/api/v1/friendship_requests", params: { format: :json }
    end
  end
end
