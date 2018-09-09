require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  # include Devise::Test::ControllerHelpers

  let(:user) { FactoryBot.create :user }

  describe 'POST /events' do
    before do
      sign_in user
    end

    it 'creates an event' do
      post '/events', params: { name: 'Mini Mansions', date_time: '2018-7-23-21.5' }
      expect(Event.all.any?{ |event| event.name == 'Mini Mansions'}).to be(true)
    end
  end
end
