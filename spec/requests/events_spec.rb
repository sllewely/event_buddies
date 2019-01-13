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
      expect(event.uuid).not_to be_nil
    end
  end

  describe 'POST /set_status' do
    let(:event) { create :event }
    let(:params) { { event: 1} }

    it 'sets event to going' do
      post '/api/v1/events/set_status', params: params

    end
  end
end
