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
    status = current_user.event_statuses.find_or_initialize_by(event_id: params[:uuid])
    if status.update(status_params)
      #some success json
    else
      render json: status.errors.full_messages, status: 422
    end
  end

  private

  def event_params
    params.permit(:name, :date_time, :description, :event_link, :location)
  end

  def status_params
    params.require(:set_status).permit(:status)
  end
end
