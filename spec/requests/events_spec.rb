require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  let(:user) { create :user }

  describe 'POST /events' do
    before do
      sign_in user
    end

    it 'creates an event' do
      post '/api/v1/events', params: { name: 'Mini Mansions', date_time: '2018-7-23-21.5' }
      events = Event.where(name: 'Mini Mansions')
      expect(events).to exist
      expect(events.first.user).to eq(user)
    end
  end
end
