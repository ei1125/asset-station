class Year < ApplicationRecord
  #同じユーザーで同じ数字は入力されない
  validates :year, uniqueness: { scope: :user_id}

  has_many :months, dependent: :destroy
  belongs_to :user
  has_many :incomes, through: :months
  has_many :expenses, through: :months
end
