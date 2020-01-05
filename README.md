# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :incomes
- has_many :expenses

## incomesテーブル

|Column|Type|Options|
|------|----|-------|
|item|string|null: false|
|cf|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|month_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :month

## expensesテーブル

|Column|Type|Options|
|------|----|-------|
|item|string|null: false|
|cf|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|month_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :month

## monthsテーブル

|Column|Type|Options|
|------|----|-------|
|when|integer|null: false|
|month|integer|null: false|
|year_id|integer|null: false, foreign_key: true|

### Association
- has_many :incomes
- has_many :expenses
- belongs_to :year
- has_many :assets, dependent: :destroy

## yearsテーブル

|Column|Type|Options|
|------|----|-------|
|when|integer|null: false|
|year|integer|null: false|

### Association
- has_many :months, dependent: :destroy
- has_many :assets, through: :months

## Assetsテーブル

|Column|Type|Options|
|------|----|-------|
|item|string|null: false|
|money|integer|null: false|
|deposit|integer||
|month_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :month
- has_one :year, through: :month

## Debtsテーブル

|Column|Type|Options|
|------|----|-------|
|item|string|null: false|
|debt|integer|null: false|
|interest_rate|integer||

### Association
- belongs_to :user

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
