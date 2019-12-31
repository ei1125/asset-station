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
|year_id|integer|null: false, foreign_key: true|

### Association
- has_many :incomes
- has_many :expenses
- belongs_to :year

## yearsテーブル

|Column|Type|Options|
|------|----|-------|
|when|integer|null: false|

### Association
- has_many :months

## Assetsテーブル

|Column|Type|Options|
|------|----|-------|
|item|string|null: false|
|asset|integer|null: false|
|deposit|integer||

### Association
- belongs_to :user

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
