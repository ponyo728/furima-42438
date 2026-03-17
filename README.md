## users

|Column            |Type  |Options    |
|------------------|------|-----------|
|nickname          |string|null: false|
|email           |string|unique: true, null: false|
|encrypted_password|string|null: false|
|first_name        |string|null: false|
|last_name         |string|null: false|
|birth_date        |date  |null: false|


### Association
has_many :items
has_many :orders

## items

|Column         |Type      |Options    |
|---------------|----------|-----------|
|image          |string    |null: false|
|name           |string    |null: false|
|description    |text      |null: false|
|category       |string    |null: false|
|condition      |string    |null: false|
|shipping_cost  |integer   |null: false|
|shipping_region|string    |null: false|
|shipping_time  |string    |null: false|
|price          |integer   |null: false|
|user           |references|null: false, foreign_key|


### Association
belongs_to :user
has_one :order

## orders

|Column |Type      |Options                |
|-------|----------|-----------------------|
|user   |references|null:false, foreign_key|
|item   |references|null:false, foreign_key|

### Association
belongs_to :user
belongs_to :item
belongs_to :address

## addresses

|Column          |Type  |Options       |
|----------------|------|--------------|
|post_code       |string|null: false   |
|prefectures     |string|null: false   |
|municipalities  |string|null: false   |
|street_address  |string|null: false   |
|building_name   |string|optional: true|
|telephone_number|string|null: false   |


### Association
has_many :orders