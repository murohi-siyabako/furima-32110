# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| encrypted_password | string | null: false |
| first_name   | string | null: false |
| family_name  | string | null: false |
| first_name_kana | string | null: false |
| family_name_kana | string | null: false |
| birth_day | date | null: false |

### Association

- has_many :items
- has_one :purchase_historys

## sending_destinations テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post_code | string | null: false                    |
| prefecture_id | integer | null: false                |
| city | string | null: false                          |
| house_number | string | null: false                  |
| building_name | string |                             |
| phone_number | string | null: false                 |
| purchase_history | references | null: false, foreign_key: true |



## items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| introduction | text | null: false                     |
| price | integer | null: false                         |
| item_condition_id | integer | null: false                |
| postage_id | integer | null: false                 |
| prefecture_id | integer | null: false              |
| prepare_id | integer | null: false, foreign_key:true |
| category_id | integer | null: false, foreign_key:true |
| user | references | null: false, foreign_key:true | 

### Association

- belongs_to :user
- belongs_to :purchase_history

## purchase_historys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user | references | null: false, foreign_key:true |
| item | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
