FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    user {user_id}
    item {item_id}
  end
end
