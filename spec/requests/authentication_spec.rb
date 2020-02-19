require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:user) { create :user }

  let(:params) do
    { user: { email: user.email, password: user.password } }
  end

  describe 'POST login' do
    let(:url) { '/login.json' }

    context 'valid credentials' do
      before { post url, params: params }

      specify { expect(response.status).to eq(200) }
      specify { expect(response.headers['Authorization']).to be_present }

      it 'returns valid JWT token' do
        token_from_request = response.headers['Authorization'].split(' ').last
        decoded_token = JWT.decode(token_from_request, ENV['DEVISE_JWT_SECRET_KEY'], true)

        expect(decoded_token.first['sub']).to be_present
      end
    end

    context 'invalid credentials' do
      let(:params) do
        { user: { email: 'invalid@email.comn', password: 'password' } }
      end

      before { post url, params: params }

      specify { expect(response.status).to eq 401 }
    end
  end
end
