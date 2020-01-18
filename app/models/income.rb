class Income < ApplicationRecord
  validates :item, uniqueness: { scope: [:user_id, :month_id]}
  validates :cf, numericality: { greater_than_or_equal_to: 0 }
  validates :item, presence: true

  belongs_to :user
  belongs_to :month
  has_one :year, through: :month
end
