class API::V1::EventsController < API::V1::APIController

  # @param page - the next page of events to request
  def index
    @events = Event.all.order(:date_time).today_onwards.page(params[:page].to_i || 1)
    json_response(@events)
  end

  def create
    event = Event.new(event_params)
    event.user_event_responses.new(user: current_user, host: true, status: :going)
    event.save!

    json_response([event])
  end

  def show
    json_response(Event.find(params[:id]))
  end

  private

  def event_params
    params.permit(:name, :date_time, :description, :event_link, :location)
  end
end
