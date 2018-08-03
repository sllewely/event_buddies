class Api::EventsController < ApiController
  def index
    @events = Event.all
    json_response(@events)
  end

  def create
    event = Event.create!(event_params)
    json_response(event)
  end

  def show
    json_response(Event.find(params[:id]))
  end

  private

  def event_params
    params.permit(:name, :date_time, :description, :event_link, :location)
  end
end
