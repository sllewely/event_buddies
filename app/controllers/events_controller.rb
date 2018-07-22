class EventsController < ApiController
  def index
    @events = Event.all
    json_response(@events)
  end

  def create
    event = Event.create!(event_params)
    json_response(event)
  end

  private

  def event_params
    params.permit(:name, :date_time, :description, :event_link, :location)
  end
end