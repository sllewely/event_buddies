require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  let(:user) { create :user }

  describe 'POST /events' do
    let(:params) { { name: 'Mini Mansions', date_time: '2018-7-23-21.5' } }

    before do
      sign_in user
      post '/api/v1/events', params: params, as: :json
    end

    it 'creates an event' do
      event = Event.find_by(name: params[:name])

      expect(event).to be_persisted
      expect(event.id).not_to be_nil
      expect(event.users).to match_array([user])
      expect(event.hosts).to match_array([user])
    end
  end

  describe 'GET /events' do
    let(:event1) { create :event }
    let(:event2) { create :event2 }
    let(:user2) { create :user2 }

    before do
      sign_in user
    end

    it 'gets all of the events I have subscribed to' do

    end

    it 'gets all of the events I have created' do
      post '/api/v1/events', params: { name: 'Mini Mansions', date_time: '2018-7-23-21.5' }
      post '/api/v1/events', params: { name: 'Queens of the Stone Age', date_time: '2018-7-25-21.5' }

      get '/api/v1/events', as: :json
      result = JSON.parse(response.body)

      expect(result.size).to eq(2)
      expect(result.any? { |r| r['name'] == 'Mini Mansions' }).to be(true)
      expect(result.any? { |r| r['name'] == 'Queens of the Stone Age' }).to be(true)
    end

    it 'gets all of the events I am subscribed to or am the host of' do
      # TODO
    end
  end
end
