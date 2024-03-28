class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to'/'
  end

  private
  def item_params
    params.require(:item).parmit(
      :item_name,
      :item_description,
      :category_id,
      :item_condition_id,
      :shipping_fee_id,
      :prefecture_id,
      :days_to_ship_id,
      :price,
      :user,
      )
  end
end
