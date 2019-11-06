class AttendancesController < ApplicationController

  def new
    @amount = Event.find(params[:event_id]).price * 100
  end

  def create
  end


  def index
  end
end
