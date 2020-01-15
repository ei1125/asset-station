class Year < ApplicationRecord
  #同じユーザーで同じ数字は入力されない
  validates :year, uniqueness: { scope: :user_id}
  validates :year, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 1 }

  has_many :months, dependent: :destroy
  belongs_to :user
  has_many :incomes, through: :months
  has_many :expenses, through: :months
  has_many :assets, through: :months
  has_many :debts, through: :months
end
