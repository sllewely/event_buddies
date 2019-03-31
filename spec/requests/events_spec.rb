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
      expect(event.id).not_to be_nil
      expect(event.hosts).to match_array([user])
    end
  end

  describe 'GET /events' do
    it 'gets all of the events I have subscribed to' do

    end

    it 'gets all of the events I have created' do

    end

    it 'gets all of the events I am subscribed to or am the host of' do

    end
  end
end
