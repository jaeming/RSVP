class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @events = current_user.events
    else
      not_authenticated
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    if current_user
      @event = current_user.events.new(event_params)

      respond_to do |format|
        if @event.save
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end

    else
      not_authenticated
    end
  end

  def update
    if current_user
      @event = current_user.events.find(params[:id])

      respond_to do |format|
        if @event.update(event_params)
          format.html { redirect_to @event, notice: 'Event was successfully updated.' }
          format.json { render :show, status: :ok, location: @event }
        else
          format.html { render :edit }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end

    else
      not_authenticated
    end
  end

  def destroy
    if current_user
      @event = current_user.events.find(params[:id])
      @event.destroy!
      respond_to do |format|
        format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      not_authenticated
    end
  end

  private

    def not_authenticated
      redirect_to root_path, :alert => 'Please sign in or sign up first.'
    end

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :theme, :date, :host, :location, :image)
    end
end
