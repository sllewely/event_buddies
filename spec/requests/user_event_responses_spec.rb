require 'rails_helper'

RSpec.describe 'User Event Responses API', type: :request do
  let(:user) { create :user }

  describe 'POST /events/:id/user_event_response' do
    let(:event) { create :event, creator: user }
    let(:params) { { event_id: event.id, } }

    before do
      sign_in user
    end

    it 'sets event to going' do
      post "/api/v1/events/#{event.id}/user_event_responses", params: params.merge!(status: 'going')

      event_status = UserEventResponse.find_by(user: user, event: event)
      expect(event_status).to be_persisted
      expect(event_status.user).to eq(user)
      expect(event_status.status).to eq('going')
      expect(event_status.id).not_to be_nil
    end

    it 'updates existing status' do
      post "/api/v1/events/#{event.id}/user_event_responses", params: params.merge!(status: 'interested')
      events = UserEventResponse.where(user: user, event: event)
      expect(events.size).to eq(1)
      expect(events.first.status).to eq('interested')

      post "/api/v1/events/#{event.id}/user_event_responses", params: params.merge!(status: 'cant_go')
      events = UserEventResponse.where(user: user, event: event)
      expect(events.size).to eq(1)
      expect(events.first.status).to eq('cant_go')
    end
  end
end
