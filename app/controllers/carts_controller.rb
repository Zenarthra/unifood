class CartsController < ApplicationController
  def show
  	@totalcost = current_order.subtotal
    @order_items = current_order.order_items
  end

end