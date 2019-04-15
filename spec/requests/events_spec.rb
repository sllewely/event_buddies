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
    let(:event_a) { create(:event, name: 'Mini Mansions') }
    let(:event_b) { create(:event, name: 'Queens of the Stone Age') }
    let(:event_c) { create(:event, name: "O'Brother") }
    let(:event_d) { create(:event, name: 'Planning for a Burial') }
    let(:event_e) { create(:event, name: 'Queen') }

    before do
      sign_in user

      create(:user_event_response, user: user, event: event_a, host: true)
      create(:user_event_response, user: user, event: event_b)
      create(:user_event_response, user: user, event: event_d, host: true)
      create(:user_event_response, user: user, event: event_e)

      get '/api/v1/events', as: :json
    end

    it 'gets all of the events I have been invited to' do
      expect(result.any? { |r| r['name'] == event_b.name }).to be(true)
      expect(result.any? { |r| r['name'] == event_e.name }).to be(true)
    end

    it 'gets all of the events I have created' do
      expect(result.any? { |r| r['name'] == event_a.name }).to be(true)
      expect(result.any? { |r| r['name'] == event_d.name }).to be(true)
    end

    it 'gets all of the events I am subscribed to or am the host of' do
      expect(result.size).to eq(4)
    end

    it 'does not get events that I have not been invited to' do
      expect(result.any? { |r| r['name'] == event_c.name }).to be(false)
    end
  end

  def result
    JSON.parse(response.body)
  end
end
