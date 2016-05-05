class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.all.includes(:venue).order(:date)
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

  end

  private

  # Strong params for security
  def event_params
    params.require(:event).permit(:name, :description, :date, :start_time)
  end
end
