class API::V1::UserEventResponsesController < API::V1::APIController
  before_action :require_event
  def create
    status = current_user.user_event_responses.find_or_initialize_by(event_id: params[:event_id])
    if status.update(status_params)
      #some success json
    else
      render json: { errors: status.errors.full_messages }, status: 422
    end
  end

  private

  def require_event
    return if Event.where(id: params[:event_id]).exists?
    render json: { errors: 'Event does not exist' }, status: 422
  end

  def status_params
    params.permit(:status)
  end
end
