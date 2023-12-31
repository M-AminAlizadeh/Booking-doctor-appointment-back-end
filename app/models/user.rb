class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # relationships
  has_one_attached :image, dependent: :destroy
  has_many :reservations, dependent: :destroy

  # validations
  validates :name, presence: true, length: { in: 3..150 }
  validates :password, presence: true, length: { in: 6..20 }
end
