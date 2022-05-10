
## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| name(katakana)     | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items


## items テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| item_name       | string  | null: false                    |
| description     | text    | null: false                    |
| category        | string  | null: false                    |
| status          | string  | null: false                    |
| shipping_charge | integer | null: false                    |
| days_to_ship    | integer | null: false                    |
| price           | integer | null: false                    |
| sell_user       | string  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy_information
- has_one    :ship_information


## buy_informations テーブル

| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| buy_user | string | null: false, foreign_key: true |
| buy_item | string | null: false, foreign_key: true |

### Association

- belongs_to :items


## ship_informations テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| PostalCode  | integer | null: false |
| ShipRegion  | string  | null: false |
| ShipCity    | string  | null: false |
| ShipAddress | string  | null: false |

### Association

- belongs_to :items