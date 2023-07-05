# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| kana_last_name     | string | null: false |
| kana_first_name    | string | null: false |
| birth_date         | date   | null: false |


### Association

- has_many :items
- has_many :orders


##  itemsテーブル

| Column                  | Type       | Options                       |
| ----------------------- | ---------- | ----------------------------- |
| item_name               | string     | null: false                   |
| description（商品の説明） | text       | null: false                   |
| category_id  (カテゴリー) | integer    | null: false                   |
| condition_id（商品の状態）| integer    | null: false                   |
| fee_id    （配送料の負担） | integer    | null: false                   |
| region_id （発送元の地域） | integer    | null: false                   |
| days_id （発送までの日数） | integer    | null: false                   |
| price(価格)              | integer    | null: false                   |
| user                    | references | null: false, foreign_key: true|


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| delivery_addresses | reference | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery_address

##  delivery_addressesテーブル

| Column                | Type   | Options     |
| --------------------- | -----  | ----------- |
| postal_code(郵便番号)  | string | null: false |
| prefecture(都道府県)   | string | null: false |
| city(市町村)           ｜ string| null: false |
| address(番地)          | string | null: false |
| building_name(建物名)  | string |             |
| phone_number （電話番号）| string | null: false |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :order
