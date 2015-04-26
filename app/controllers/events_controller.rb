class EventsController < ApplicationController
  respond_to :html
  before_action :authenticate_user!, except: :show

  def index
    @events = current_user.events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def create
    @event = current_user.events.build(event_params)
    @event.save
    redirect_to @event
  end

  def update
    @event = current_user.events.find(params[:id])
    @event.update_attributes!(event_params)
    redirect_to @event
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy!
    redirect_to events_url
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :theme, :date, :host, :location, :image)
    end
end
