class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.all.includes(:venue, :user_statuses_for_events).where(['date >= ?', Date.today]).order(:date)
  end

  def create
    venue = Venue.find_or_create_by(name: params[:venue][:name])
    event = Event.create(event_params.merge!(venue: venue))
    artist = Artist.find_or_create_by(name: params[:artist][:name])
    EventsArtist.create(event_id: event.id, artist_id: artist.id, headliner: true)
    redirect_to events_path
  end

  def show

  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    if params.key?(:user_statuses_for_events)
      UserStatusesForEvent.update_or_create(*[current_user.id, user_status_params[:event_id], user_status_params[:status]])
    end
    redirect_to events_path
  end

  private

  # Strong params for security
  def event_params
    params.require(:event).permit(:name, :description, :date, :start_time)
  end

  def user_status_params
    params.require(:user_statuses_for_events).permit(:event_id, :status)
  end

end
