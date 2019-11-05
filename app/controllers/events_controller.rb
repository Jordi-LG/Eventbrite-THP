class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create

    @event = Event.new(params_event)
    @event.admin_id = current_user.id

    puts "*" *60
    puts current_user.id
    puts "*" * 60
    puts @event.id

    if @event.save
      redirect_to event_path(@event.id)
      flash[:success]= "Ton évenement a bien été créé !"
    else
      render new_event_path
  end

  puts "*" * 60
  puts @event.errors.messages
end
  def show
    @event = Event.find(params[:id])
  end

private

  def params_event
      params.require(:event).permit(:start_date, :duration, :title, :price, :description, :location)
  end

end
