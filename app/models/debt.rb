class Debt < ApplicationRecord
  validates :item, uniqueness: { scope: [:user_id, :month_id]}

  belongs_to :user
  belongs_to :month
  has_one :year, through: :month
end
