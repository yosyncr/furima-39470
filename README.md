# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_name          | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| address            | string | null: false |


### Association

- has_many :items
- has_many :orders

##  itemsテーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| item_name   | string     | null: false                   |
| value       | string     | null: false                   |
| category    | string     | null: false                   |
| user        | references | null: false, foreign_key: true|

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users
