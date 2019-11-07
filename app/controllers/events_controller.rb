class EventsController < ApplicationController
  #INACESSIBLE SUR CES PAGES SI PAS CONNECTÉ
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

    if @event.save
      redirect_to event_path(@event.id)
      flash[:success]= "Ton évenement a bien été créé !"
    else
      render new_event_path
  end

end
  def show
    @event = Event.find(params[:id])
    @count = count
    @end_date = end_date
    @participated = participated?
  end

private
  #INFOS RECUPERER DE LA CRÉATION D'EVENT
  def params_event
      params.require(:event).permit(:start_date, :duration, :title, :price, :description, :location, :avatar)
  end

  #NOMBRE DE USER INSCRIT À L'EVENT
  def count
    Event.find(params[:id]).users.all.count
  end

  #CALCUL DE LA DATE DE FIN, IL FAUT PASSER LA DURATION EN MINUTES
  def end_date
    minutes = Event.find(params[:id]).duration * 60
    (Event.find(params[:id]).start_date + minutes).strftime('%d of %B, %Y - %HH%M')
  end

  def participated?
    Event.find(params['id']).users.ids
  end

end
