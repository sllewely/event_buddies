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
    # binding.pry
    # event_status = EventStatus.where(event: params[:event_id], user: current_user).first_or_create!
    # event_status.update!(status_params)
    # binding.pry
    EventStatus.create!(status_params.merge!(user_id: current_user.id))
    binding.pry
    4
  end

  private

  def event_params
    params.permit(:name, :date_time, :description, :event_link, :location)
  end

  def status_params
    params.permit(:event_id, :status)
  end
end
