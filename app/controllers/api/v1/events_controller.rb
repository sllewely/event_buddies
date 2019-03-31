class API::V1::EventsController < API::V1::APIController
  def index
    @events = current_user.events
    json_response(@events)
  end

  def create
    ActiveRecord::Base.transaction do
      @event = Event.create!(event_params)
      UserEventResponse.create!(event: @event, user: current_user, host: true, status: :going)
    end

    json_response([@event])
  end

  def show
    json_response(Event.find(params[:id]))
  end

  private

  def event_params
    params.permit(:name, :date_time, :description, :event_link, :location)
  end
end
