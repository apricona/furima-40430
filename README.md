# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false | 
| first_name_kana    | string | null: false |
| date_of_birth      | date   | null: false |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :oder
  has_one_attached :image


### Supplement
- 画像投稿の実装は、ActiveStorageを使用すること（画像の複数枚投稿は追加実装となるため、この段階では、画像1枚での出品機能を実装する）。


## addresses テーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | --------------------------------|
| postal_code    | string     | null: false,                    |
| prefecture_id  | integer    | null: false                     |
| city           | string     | null: false                     |
| street_address | string     | null: false                     |
| building_name  | string     |                                 |
| phone_number   | string     | null: false |
| order          | references | null: false, foreign_key: true  |

### Association
- belongs_to :order


## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address
