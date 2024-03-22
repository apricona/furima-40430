# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false ,length: { minimum: 6 }半角英数字混合|
| nickname           | string | null: false |
| last_name          | string | null: false, 全角（漢字・ひらがな・カタカナ）|
| first_name         | string | null: false, 全角（漢字・ひらがな・カタカナ）|
| last_name_kana     | string | null: false, 全角（カタカナ）|
| first_name_kana    | string | null: false, 全角（カタカナ）|
| date_of_birth      | date   | null: false |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| item_name        | string     | null: false |
| item_description | text       | null: false |
| category         | string     | null: false |
| item_condition   | string     | null: false |
| shipping_fee     | string     | null: false |
| shipping_origin  | string     | null: false |
| days_to_ship     | string     | null: false |
| price            | integer    | null: false,\333~\9,999,999, 半角数値 |
| sales_commission | decimal    | null: false |
| sales_profit     | decimal    | null: false |
| status           | boolean    | null: false |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :oder

### Supplement
- 画像投稿の実装は、ActiveStorageを使用すること（画像の複数枚投稿は追加実装となるため、この段階では、画像1枚での出品機能を実装する）。



## orders テーブル

| Column         | Type       | Options                              |
| -------------- | ---------- | ------------------------------------ |
| postal_code    | string     | null: false, 半角文字列              |
| prefecture     | string     | null: false                          |
| city           | string     | null: false                          |
| street_address | string     | null: false                          |
| building_name  | string     |                                      |
| phone_number   | integer    | null: false,10桁以上11桁以内の半角数値|
| user_id (FK)   | references | null: false, foreign_key: true       |
| item_id (FK)   | references | null: false, foreign_key: true       |

### Association
- belongs_to :user
- belongs_to :item
