class API::V1::EventsController < API::V1::APIController
  def index
    @events = Event.all
    json_response(@events)
  end

  def create
    event = Event.create(event_params.merge!(creator: current_user))
    json_response([event])
  end


  def set_status
    event = EventStatus.first_or_initialize(status_params.slice(:event_id).merge!(user_id: current_user.id))
    event.status = status_params[:status]
    event.save!
  end

  private

  def event_params
    params.permit(:name, :date_time, :description, :event_link, :location)
  end

  def status_params
    params.permit(:event_id, :status)
  end
end
