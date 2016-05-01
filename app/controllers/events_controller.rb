class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.all.order(:date)
  end

  def create
    Event.create(event_params)
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
