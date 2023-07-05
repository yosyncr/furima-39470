# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| kana_name          | string | null: false |
| birth_date         | date   | null: false |

### Association

- has_many :items
- has_many :orders
- belongs_to :delivery_address

##  itemsテーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| item_image  | text       | null: false                   |
| item_name   | string     | null: false                   |
| explanation | text       | null: false                   |
| value       | integer     | null: false                   |
| category    | string     | null: false                   |
| situation   | string     | null: false                   |
| load        | string     | null: false                   |
| region      | string     | null: false                   |
| shipping_days   | integer    | null: false               |
| user        | references | null: false, foreign_key: true|


### Association

- belongs_to :user
- has_one :order
- has_one :delivery_address
## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :delivery_address

##  delivery_addressesテーブル

| Column                | Type   | Options     |
| --------------------- | -----  | ----------- |
| postal_code(郵便番号)  | string | null: false |
| prefecture(都道府県)   | string | null: false |
| city(市町村)           ｜ string| null: false |
| address(番地)          | string | null: false |
| building_name(建物名)  | string |             |
| phone_number （電話番号）| string | null: false |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :delivery_address
