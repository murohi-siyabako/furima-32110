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
| user | references | null:false | foreign_key |

### Association

- belongs_to :user

## sending_destinations テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post_code | integer | null: false                    |
| prefecture_code | integer | null: false              |
| city | string | null: false                          |
| house_number | string | null: false                  |
| building_name | string |                             |
| phone_number | integer | null: false                 |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## credit_cards テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | integer | null: false                       |
| card_id | integer | null: false                       |
| expiration | integer | null: false                    |

### Association

- belongs_to :user

## items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| introduction | text | null: false                     |
| price | integer | null: false                         |
| item_condition | integer | null: false                |
| postage_payer | integer | null: false                 |
| prefecture_ code | integer | null: false              |
| preparation_day | integer | null: false, foreign_key:true |
| category | references | null: false, foreign_key:true |
| seller | references | null: false, foreign_key:true | 

### Association

- belongs_to :user

## item_imgs テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image | string | null: false |
| item | references | null: false |

### Association

- belongs_to :item
