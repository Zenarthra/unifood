class ChargesController < ApplicationController

	Stripe.api_key = ENV["SECRET_KEY"]
  

	def new
    @totalcost = current_order.subtotal
	end

	def create

  useraddress = current_user.address
  userpostcode = current_user.postcode
  full_address = useraddress.to_s + " , " + userpostcode.to_s
  
  # Amount in GBP
	 @amount = (current_order.subtotal*(100)).to_i

 	 customer = Stripe::Customer.create(
   	 :email => params[:stripeEmail],
   	 :source  => params[:stripeToken]
  	)

  	charge = Stripe::Charge.create(
    	:customer    => customer.id,
    	:amount      => @amount,
    	:description  => full_address,
  	  :currency    => 'gbp'
 	 )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
  
end
