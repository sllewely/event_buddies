class API::V1::UserEventResponsesController < API::V1::APIController

  # @param status - the rsvp status
  def create
    status = current_user.user_event_responses.find_or_initialize_by(event_id: event.id)
    if status.update(status_params)
      #some success json
    else
      render json: { errors: status.errors.full_messages }, status: 422
    end
  end

  private

  def event
    @event ||= Event.find(params[:event_id])
  end

  def status_params
    params.permit(:status)
  end
end
