class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id,
                :item_id,
                :postal_code,
                :prefecture_id,
                :city, 
                :street_address, 
                :building_name, 
                :phone_number, 
                :order_id


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :city
    validates :street_address
    validates :phone_number, numericality: {only_integer: true,  greater_than_or_equal_to: 10**10, less_than_or_equal_to: 10**11 - 1 }
    validates :order_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Orders.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end