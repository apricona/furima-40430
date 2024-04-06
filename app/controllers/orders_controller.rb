class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @orde_address = OrderAddress.new
  end
end
