class Month < ApplicationRecord
  #同じユーザーで同じ数字は入力されない
  validates :month, uniqueness: { scope: [:user_id, :year_id]}
  validates :month, presence: true
  validates :month, numericality: { less_than_or_equal_to: 12 }
  validates :month, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :year
  belongs_to :user
  has_many :incomes, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :assets, dependent: :destroy
  has_many :debts, dependent: :destroy
end
