class Month < ApplicationRecord
  #同じユーザーで同じ数字は入力されない
  validates :month, uniqueness: { scope: [:user_id, :year_id]}

  belongs_to :year
  belongs_to :user
  has_many :incomes, dependent: :destroy
  has_many :expenses, dependent: :destroy
end
