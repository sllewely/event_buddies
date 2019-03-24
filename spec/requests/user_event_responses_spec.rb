require 'rails_helper'

RSpec.describe 'User Event Responses API', type: :request do
  let(:user) { create :user }

  describe 'POST /events/:id/user_event_response' do
    let(:event) { create :event, creator: user }

    before do
      sign_in user
    end

    it 'sets event to going' do
      post "/api/v1/events/#{event.id}/user_event_responses", params: { status: 'going' }

      event_status = UserEventResponse.find_by(user: user, event: event)
      expect(event_status).to be_persisted
      expect(event_status.user).to eq(user)
      expect(event_status.status).to eq('going')
      expect(event_status.id).not_to be_nil
    end

    it 'updates existing status' do
      post "/api/v1/events/#{event.id}/user_event_responses", params: { status: 'interested' }
      events = UserEventResponse.where(user: user, event: event)
      expect(events.size).to eq(1)
      expect(events.first.status).to eq('interested')

      post "/api/v1/events/#{event.id}/user_event_responses", params: { status: 'cant_go' }
      events = UserEventResponse.where(user: user, event: event)
      expect(events.size).to eq(1)
      expect(events.first.status).to eq('cant_go')
    end

    it 'fails if the event does not exist' do
      fake_uuid = '00000000-0000-0000-0000-000000000000';
      response = post "/api/v1/events/#{fake_uuid}/user_event_responses", params: { status: 'going' }
      expect(response).to eq(404)
    end
  end
end
