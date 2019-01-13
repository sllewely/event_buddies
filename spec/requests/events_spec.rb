require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  let(:user) { create :user }

  describe 'POST /events' do
    let(:params) { { name: 'Mini Mansions', date_time: '2018-7-23-21.5' } }

    before do
      sign_in user
      post '/api/v1/events', params: params
    end

    it 'creates an event' do
      event = Event.find_by(name: params[:name])

      expect(event).to be_persisted
      expect(event.creator).to eq(user)
      expect(event.id).not_to be_nil
    end
  end

  describe 'POST /set_status' do
    let(:event) { create :event, creator: user }
    let(:params) { { event_id: event.id, } }

    before do
      sign_in user
    end

    it 'sets event to going' do
      post "/api/v1/events/#{event.id}/set_status", params: params.merge!(status: 'going')

      event_status = EventStatus.find_by(user: user, event: event)
      expect(event_status).to be_persisted
      expect(event_status.user).to eq(user)
      expect(event_status.status).to eq('going')
      expect(event_status.id).not_to be_nil
    end

    it 'updates existing status' do

    end
  end
end
