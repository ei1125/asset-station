class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  has_many :years
  has_many :incomes
  has_many :expenses
  has_many :assets
  has_many :debts

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "GuestUser"
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
