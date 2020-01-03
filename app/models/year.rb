class Year < ApplicationRecord
  #同じユーザーで同じ数字は入力されない
  validates :year, uniqueness: { scope: :user_id}

  has_many :months
  belongs_to :user
end
