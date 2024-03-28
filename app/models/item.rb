class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_fee
  belongs_to :days_to_ship

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

  validates :category_id, 
            :item_condition_id, numericality: { other_than: 1 } 
end
