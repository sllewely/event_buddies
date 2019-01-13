class API::V1::EventsController < API::V1::APIController
  def index
    @events = Event.all
    json_response(@events)
  end

  def create
    event = Event.create!(event_params.merge!(creator: current_user))
    json_response([event])
  end


  def set_status

  end

  private

  def event_params
    params.permit(:name, :date_time, :description, :event_link, :location)
  end
end
