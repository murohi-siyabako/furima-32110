# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one :profile
- has_one :sending_destination
- has_one :credit_card

## profiles テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| first_name   | string | null: false |
| family_name  | string | null: false |
| first_name_kana | string | null: false |
| family_name_kana | string | null: false |
| birth_day | date | null: false |
| user | references | null:false, foreign_key |

### Association

- belongs_to :user

## sending_destinations テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post_code | string | null: false                    |
| prefecture_code | integer | null: false              |
| city | string | null: false                          |
| house_number | string | null: false                  |
| building_name | string |                             |
| phone_number | string | null: false                 |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| introduction | text | null: false                     |
| price | integer | null: false                         |
| item_condition | integer | null: false                |
| postage_id | integer | null: false                 |
| prefecture_id | integer | null: false              |
| prepare_id | integer | null: false, foreign_key:true |
| category | references | null: false, foreign_key:true |
| seller | references | null: false, foreign_key:true | 

### Association

- belongs_to :user

## purchase_history テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user | references | null: false, foreign_key:true |
| item | references | null: false, foreigen_key:true |

### Association

belongs_to :user


