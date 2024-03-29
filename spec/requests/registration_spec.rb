require 'rails_helper'

RSpec.describe 'Registration', type: :request do
  let(:params) do
    { user: { email: 'user@example.com', password: 'password' } }
  end

  describe 'POST signup' do
    let(:url) { '/signup.json' }

    before { post url, params: params }

    context 'user does not exist' do
      let(:params) do
        { user: { email: 'user@example.com', password: 'password', first_name: 'bob', last_name: 'saidso' } }
      end

      specify { expect(response.status).to eq(200) }
      specify do
        expect(User.where(email: 'user@example.com', first_name: 'bob', last_name: 'saidso').exists?).to eq true
      end
    end

    context 'existing user' do
      let(:user) { create :user }
      let(:params) do
        { user: { email: user.email, password: 'password', first_name: 'bob', last_name: 'saidso' } }
      end

      specify { expect(response.status).to eq 400 }
      specify { expect(result['errors'].first['detail']['email'].first).to eq 'has already been taken' }
    end
  end
end
