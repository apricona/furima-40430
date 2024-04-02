FactoryBot.define do
  factory :item do
    item_name         {'テスト商品'}
    item_description  {'テスト商品の説明'}
    category_id       {2}
    item_condition_id {2}
    shipping_fee_id   {2}
    prefecture_id     {2}
    days_to_ship_id   {2}
    price             {'500'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end