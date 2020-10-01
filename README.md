#　テーブル設計

## users テーブル

| Column          | Type         | Options     |
| --------------- | ------------ | ----------- |
| nickname        | string       | null: false |
| email           | string       | null: false |
| password        | string       | null: false |
| fast_name       | string       | null: false |
| last_name       | string       | null: false |
| fast_name_kana  | string       | null: false |
| last_name_kana  | string       | null: false |
| birth_date      | date         | null: false |

## Association
- has_many :items
- has_many :item_oders

## items テーブル

| Column                  | Type         | Options           |
| ----------------------- | ------------ | ----------------- |
| name                    | string       | null: false       |
| info                    | text         | null: false       |
| category_id             | integer      | null: false       |
| sales_status_id         | integer      | null: false       |
| shapping_fee_status_id  | integer      | null: false       |
| prefecture_id           | integer      | null: false       |
| scheduled_delivery_id   | integer      | null: false       |
| price                   | integer      | null: false       |
| user                    | references   | foreing_key: true |

## Association
- belongs_to :user
- has_one :item_oder

## addresses テーブル

| Column          | Type         | Options           |
| --------------- | ------------ | ----------------- |
| postal_code     | string       | null: false       |
| prefecture_id   | integer      | null: false       |
| city            | string       | null: false       |
| addresses       | string       | null: false       |
| building        | string       |                   |
| phone_number    | string       | null: false       |
| item_oder_id    | integer      | foreing_key: true |

## Association
- belongs_to :item_oder

## item_oders テーブル

| Column     | Type         | Options           |
| ---------- | ------------ | ----------------- |
| user_id    | integer      | foreing_key: true |
| item_id    | integer      | foreing_key: true |

## Association
- belongs_to :user
- has_one :addresse
- belongs_to :item
