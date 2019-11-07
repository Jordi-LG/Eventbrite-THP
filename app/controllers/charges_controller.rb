class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = Event.find(params[:event_id]).price * 100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })


        @attendance = Attendance.new
        @attendance.user_id = current_user.id
        @attendance.event_id = Event.find(params['event_id']).id
        @attendance.stripe_customer_id = charge.customer

    if @attendance.save
      redirect_to event_path(id: params['event_id'])
      flash[:success]= "Ta participation est enregistrée !"
    else
      render new_event_charge_path
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  end
end
