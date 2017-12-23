class Api::EventsController < Api::ApiController
  def index
    render json: { status: 'SUCCESS', message: 'beep boop', data: { name: 'sarah' } }, status: :ok
  end

end