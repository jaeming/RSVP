class EventsController < ApplicationController
  before_action :set_user_event, only: [:edit, :update, :destroy]

  def index
    if current_user
      @events = current_user.events
    else
      not_authenticated
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    if current_user

    else
      not_authenticated
    end
  end

  def create
    if current_user
      @event.new

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

    def set_user_event
      @event = current_user.events.find(event_params)
    end

    def event_params
      params.require(:event).permit(:title, :description, :theme, :date, :host, :location, :image)
    end
end
