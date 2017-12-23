class Api::EventsController < Api::ApiController
  def index
    events = Event.all_recent_events.map(&:to_hash)
    render json: { data: events }, status: :ok
  end

end