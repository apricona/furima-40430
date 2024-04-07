class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

end

private

def order_params
  params.require(:order_address).permit(
    :postal_code,
    :prefecture_id,
    :city,
    :street_address,
    :building_name,
    :phone_number,
    :order_id
    ).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
end

def pay_item
  Payjp.api_key = "sk_test_7c88c3c28e7dbefed73e501e"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end
