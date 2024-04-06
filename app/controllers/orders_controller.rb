class OrdersController < ApplicationController

  def index
    @orde_address = OrderAddress.new
  end
end
