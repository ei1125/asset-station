class Month < ApplicationRecord
  belongs_to :year
  has_many :income
  has_many :expense
end
