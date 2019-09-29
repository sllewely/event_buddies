require 'rails_helper'

RSpec.describe 'Friends Responses API', type: :request do
  let(:user) { create :user }
  let(:user2) { create :user, first_name: 'Jim' }

  before do
    sign_in user
  end

  describe 'GET /friends/' do
    it 'gets all of my friends' do

    end

    it 'returns empty array if user has no friends' do

    end

  end

end