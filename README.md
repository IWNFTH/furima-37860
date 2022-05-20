
## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name        | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :order

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order


## order テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address


## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| ship_city        | string     | null: false                    |
| ship_address     | string     | null: false                    |
| building         | string     |                                |
| tel_number       | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order