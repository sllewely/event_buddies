require 'rails_helper'

RSpec.describe 'Events API', type: :request do

  describe 'POST /events' do
    it 'creates an event' do
      post '/events', params: { name: 'Mini Mansions', date_time: '2018-7-23-21.5' }
      expect(Event.all.any?{ |event| event.name == 'Mini Mansions'})
    end
  end

end