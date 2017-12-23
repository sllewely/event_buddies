class Api::EventsController < Api::ApiController
  def index
    render json: { data: Event.all_recent_events }, status: :ok
  end

end