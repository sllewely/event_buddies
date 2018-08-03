require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  let(:event_params) { { name: 'Mini Mansions', date_time: '2018-7-23-21.5' } }

  describe 'POST /api/events' do
    it 'creates an event' do
      post '/api/events', params: event_params
      expect(Event.all.any?{ |event| event.name == 'Mini Mansions'}).to be(true)
    end
  end

  describe 'GET /api/events' do
    it 'gets all events' do
      Event.create(event_params)
      Event.create(event_params.merge!(date_time: '2018-7-24-21.5'))

      get('/api/events')
      result = JSON.parse(response.body)
      expect(result.size).to be(2)
    end
  end

  describe 'GET /api/events/:id' do
    it 'gets the event by id' do
      event = Event.create(event_params)

      get("/api/events/#{event.id}")
      result = JSON.parse(response.body)
      expect(result['name']).to eq('Mini Mansions')
    end
  end
end
