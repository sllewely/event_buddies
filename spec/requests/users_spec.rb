require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { create :user }
  let(:user2) { create :user, first_name: 'Jim' }

  before do
    sign_in user
  end

  describe 'GET /users/:id' do
    context 'requesting the current user' do
      it 'returns name and email' do
        get "/api/v1/users/#{user.id}", as: :json

        expect(result["id"]).to eq(user.id)
        expect(result["email"]).to eq(user.email)
        expect(result["first_name"]).to eq(user.first_name)
        expect(result["last_name"]).to eq(user.last_name)
        expect(result.key?("password")).to eq(false)
      end
    end

    context 'requesting another a friend user' do
      it 'returns name but not email' do
        get "/api/v1/users/#{user2.id}", as: :json

        expect(result["id"]).to eq(user2.id)
        expect(result.key?("email")).to eq(false)
        expect(result["first_name"]).to eq(user2.first_name)
        expect(result["last_name"]).to eq(user2.last_name)
        expect(result.key?("password")).to eq(false)
      end

    end

    context 'requesting a non-friend user' do

    end
  end

  describe 'GET /users' do
    it 'returns all users' do
      user
      user2

      get "/api/v1/users", as: :json

      first_names = result.map { |u| u["first_name"] }
      expect(first_names).to include(user.first_name)
      expect(first_names).to include(user2.first_name)
    end
  end


end
