class Income < ApplicationRecord
  validates :item, uniqueness: { scope: [:user_id, :month_id]}

  belongs_to :month
  belongs_to :user
  has_one :year, through: :month
  

end
