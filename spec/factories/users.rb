FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'asd1234'}
    password_confirmation {password}
    last_name             {'手須戸'}
    first_name            {'太郎'}
    last_name_kana        {'テスト'}
    first_name_kana       {'タロウ'}
    date_of_birth         {'1990-01-01'}

    factory :user_with_items do
      after(:create) do |user|
        create(:item, user: user)
      end
    end
  end
end
