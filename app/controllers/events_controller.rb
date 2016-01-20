class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    Event.create(event_params)
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :start_time)
  end
end
