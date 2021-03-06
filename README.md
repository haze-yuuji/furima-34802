# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| nickname           | string              | null: false              |
| email              | string              | null: false, unique: true|
| encrypted_password | string              | null: false              |
| first_name         | string              | null: false              |
| last_name          | string              | null: false              |
| first_name_kana    | string              | null: false              |
| last_name_kana     | string              | null: false              |
| birthday           | date　　　           | null: false              |



### Association

* has_many :items
* has_many :purchasers



## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| text                                | text       | null: false       |
| category_id                         | integer    | null: false       |
| status_id                           | integer    | null: false       |
| delivery_id                         | integer    | null: false       |
| prefecture_id                       | integer    | null: false       |
| delivery_day_id                     | integer    | null: false       |
| price                               | integer    | null: false       |
| user                                | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :purchaser



## purchasers table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| product     | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses table

| Column         | Type       | Options              |
|----------------|------------|----------------------|
| postcode       | string     | null: false          |
| prefecture_id  | integer    | null: false          |
| city           | string     | null: false          |
| block          | string     | null: false          |
| building       | string     |                      |
| tel            | string     | null: false          |
| purchaser      | references | foreign_key: true    |


### Association

- belongs_to :purchaser
