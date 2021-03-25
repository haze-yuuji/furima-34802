# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| ruby_name          | string              | null: false             |
| birthday           | datetime            | null: false             |


### Association

* has_many :items
* has_many :purchasers



## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| text                                | text       | null: false       |
| category                            | text       | null: false       |
| status                              | text       | null: false       |
| price                               | integer    | null: false       |
| user                                | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :purchasers



## purchasers table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| delivery    | integer    | null: false       |
| prefecture  | text       | null: false       |
| days        | date       | null: false       |
| user        | references | foreign_key: true |
| product     | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :addresss



## addresss table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| postcode    | integer    | null: false       |
| prefecture  | text       | null: false       |
| city        | text       | null: false       |
| block       | text       | null: false       |
| building    | text       | null: false       |
| tel         | integer    | null: false       |
| user        | references | foreign_key: true |
| product     | references | foreign_key: true |


### Association

- belongs_to :purchaser
