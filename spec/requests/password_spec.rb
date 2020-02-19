require 'rails_helper'

RSpec.describe 'Passwords', type: :request do
  let(:url) { '/password.json' }
  let(:user) { create :user }

  describe 'requesting a reset password token' do
    before { post url, params: { user: { email: user.email } }, as: :json }

    specify do
      expect(response.status).to eq(201)
      expect(user.reload.reset_password_token).not_to eq(nil)
    end
  end

  describe 'resetting the password' do
    let(:newpassword) { 'newpassword' }

    before  do
      token = user.send(:set_reset_password_token)
      params = { user: { reset_password_token: token, password: newpassword, password_confirmation: newpassword } }

      patch url, params: params
    end

    specify do
      expect(response.status).to eq(204)
      expect(user.reload.valid_password?(newpassword)).to eq(true)
    end
   end
end
