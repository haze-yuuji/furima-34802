# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | unique: true            |
| password           | string              | null: false             |
| encrypted_password | string              | null: false             |
| name               | string              | null: false             |
| ruby_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| birthday           | datetime            | null: false             |



### Association

* has_many :items
* has_many :purchasers



## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| seller                              | string     | null: false       |
| name                                | string     | null: false       |
| text                                | text       | null: false       |
| category                            | text       | null: false       |
| status                              | text       | null: false       |
| delivery                            | integer    | null: false       |
| prefecture                          | text       | null: false       |
| days                                | date       | null: false       |
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
- has_one :addresss



## addresss table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| postcode    | string     | null: false       |
| prefecture  | integer    | null: false       |
| city        | string     | null: false       |
| block       | string     | null: false       |
| building    | string     | null: false       |
| tel         | string     | null: false       |
| purchaser   | references | foreign_key: true |


### Association

- belongs_to :purchaser
