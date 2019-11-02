require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  let(:user) { create :user }

  describe 'POST /events' do
    let(:params) { { name: 'Mini Mansions', date_time: '2018-7-23-21.5' } }

    before do
      sign_in user
    end

    it 'creates an event' do
      post '/api/v1/events', params: params, as: :json

      event = Event.find_by(name: params[:name])

      expect(event).to be_persisted
      expect(event.id).not_to be_nil
      expect(event.users).to match_array([user])
      expect(event.hosts).to match_array([user])
    end

    it 'rsvps me as going when I create an event' do
      post '/api/v1/events', params: params, as: :json

      event = Event.find_by(name: params[:name])
      user_response = event.user_event_responses.first

      expect(event).to be_persisted
      expect(user_response.user_id).to eq(user.id)
      expect(user_response.status).to eq("going")
    end

    it 'creating an event fails if name is missing' do
      post '/api/v1/events', params: { date_time: Time.now + 5.days }, as: :json

      expect(result["message"]).to eq("Validation failed: Name can't be blank")
      expect(Event.all.count).to eq(0)
      expect(UserEventResponse.count).to eq(0)
    end

    it 'creating an event fails if date is missing' do
      post '/api/v1/events', params: { name: 'Date Missing Event' }, as: :json

      expect(result["message"]).to eq("Validation failed: Date time can't be blank")
      expect(Event.all.count).to eq(0)
      expect(UserEventResponse.count).to eq(0)
    end
  end

  describe 'GET /events' do
    context do
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
        event_c

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

      xit 'gets all of the events I am subscribed to or am the host of' do
        expect(result.size).to eq(4)
      end

      xit 'does not get events that I have not been invited to' do
        expect(result.any? { |r| r['name'] == event_c.name }).to be(false)
      end
      
      it 'paginates' do
        50.times do
          new_event = create(:event)
          create(:user_event_response, user: user, event: new_event)
        end

        get '/api/v1/events', as: :json

        page_1 = result
        expect(page_1.count).to eq(25)

        get '/api/v1/events', params: { page: 2 }, as: :json

        page_2 = result

        expect(page_2.count).to eq(25)
      end
    end

    context 'ordering' do
      let(:event_a) { create(:event, name: 'Mini Mansions', date_time: DateTime.now + 1) }
      let(:event_b) { create(:event, name: 'Queens of the Stone Age', date_time: DateTime.now) }
      let(:event_c) { create(:event, name: "O'Brother", date_time: DateTime.now - 5) }
      let(:event_d) { create(:event, name: 'Planning for a Burial', date_time: DateTime.now + 10) }
      let(:event_e) { create(:event, name: 'Queen', date_time: DateTime.now + 3) }

      before do
        sign_in user

        create(:user_event_response, user: user, event: event_a)
        create(:user_event_response, user: user, event: event_b)
        create(:user_event_response, user: user, event: event_c)
        create(:user_event_response, user: user, event: event_d)
        create(:user_event_response, user: user, event: event_e)

        get '/api/v1/events', as: :json
      end

      it 'get events in the right order' do
        expect(result[0]['name']).to eq('Queens of the Stone Age')
        expect(result[1]['name']).to eq('Mini Mansions')
        expect(result[2]['name']).to eq('Queen')
        expect(result[3]['name']).to eq('Planning for a Burial')

        # In the past
        expect(result.any? { |e| e['name'] == "O'Brother" }).to be(false)
      end
    end

  end

  describe 'GET /events/:id' do
    let(:event_a) do
      create(:event, name: 'Mini Mansions', date_time: DateTime.now + 1, location: "Bowery Ballroom",
             description: 'rock', event_link: 'www.google.com')
    end

    before do
      sign_in user

      create(:user_event_response, user: user, event: event_a, host: true)
    end

    it 'shows the given event I have created' do
      get "/api/v1/events/#{event_a.id}"

      expect(result['name']).to eq(event_a.name)
      expect(result['location']).to eq (event_a.location)
      expect(result['description']).to eq(event_a.description)
      expect(result['event_link']).to eq(event_a.event_link)
    end

    xit 'shows the event I am invited to' do

    end

    xit 'I cannot see an event I do not have permission to' do

    end
  end

  describe 'PATCH /events/:id' do
    let(:event_a) do
      create(:event, name: 'Mini Mansions', date_time: DateTime.now + 1, location: "Bowery Ballroom",
             description: 'rock', event_link: 'www.google.com')
    end
    let(:event_b) { create(:event, name: 'Otep', date_time: DateTime.now + 1, location: "Webster Hall") }

    before do
      sign_in user

      create(:user_event_response, user: user, event: event_a, host: true)
      create(:user_event_response, user: user, event: event_b)
    end

    it 'updates the description' do
      patch "/api/v1/events/#{event_a.id}", params: { description: "fun rock band" }, as: :json

      expect(result).to eq(true)
      expect(Event.find(event_a.id).description).to eq("fun rock band")
    end

    it 'wont let me update an event I do not host' do
      patch "/api/v1/events/#{event_b.id}", params: { description: "fun rock band" }, as: :json

      expect(response.status).to eq(404)
      expect(Event.find(event_b.id).description).to be_nil
    end
  end
end
