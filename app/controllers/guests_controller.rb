class GuestsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :update, :destroy]

  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def create
    @event = Event.find(params[:event_id])
    @guest = @event.guests.build(guest_params.merge(event: @event))
    if @guest.save
      render :recieved
    else
      render :error
    end
  end

  def update
    @guest = Guest.find(guest_params)
    @guest.update!(guest_params)
    redirect_to @guest
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy!
    redirect_to guests_url
  end

  private
    def guest_params
      params.require(:guest).permit(:name, :comment, :email)
    end
end
