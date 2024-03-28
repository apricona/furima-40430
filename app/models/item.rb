class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  validates :item_name,
            :item_description,
            :category_id,
            :item_condition_id,
            :shipping_fee_id,
            :prefecture_id,
            :days_to_ship_id,
            :price,
            :user,
            presence: true
end
