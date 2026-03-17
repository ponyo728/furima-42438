## users

|Column            |Type  |Options    |
|------------------|------|-----------|
|nickname          |string|null: false|
|email           |string|unique: true, null: false|
|encrypted_password|string|null: false|
|first_name        |string|null: false|
|first_name_kana   |string|null: false|
|last_name         |string|null: false|
|last_name_kana    |string|null: false|
|birth_date        |date  |null: false|


### Association
has_many :items
has_many :orders

## items

|Column            |Type      |Options    |
|------------------|----------|-----------|
|name              |string    |null: false|
|description       |text      |null: false|
|category_id       |string    |null: false|
|condition_id      |string    |null: false|
|shipping_cost_id  |integer   |null: false|
|prefecture_id     |string    |null: false|
|shipping_time_id  |string    |null: false|
|price             |integer   |null: false|
|user              |references|null: false, foreign_key: true|


### Association
belongs_to :user
has_one :order

## orders

|Column |Type      |Options                |
|-------|----------|-----------------------|
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses

|Column          |Type  |Options       |
|----------------|------|--------------|
|post_code       |string|null: false   |
|prefecture_id  |string|null: false   |
|municipalities  |string|null: false   |
|street_address  |string|null: false   |
|building_name   |string|              |
|telephone_number|string|null: false   |
|user            |references|null: false, foreign_key: true|


### Association
belongs_to :order