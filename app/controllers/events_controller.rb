class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end
end
