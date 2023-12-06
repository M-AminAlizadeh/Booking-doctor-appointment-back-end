class Doctor < ApplicationRecord
    # relationships
    has_one_attached :image, dependent: :destroy
    has_many :reservations, dependent: :destroy
  
    # validations
    validates :name, presence: true, length: { in: 3..150 }
    validates :specialization, presence: true, length: { in: 3..150 }
    validates :hospital, presence: true, length: { in: 3..150 }
    validates :description, presence: true, length: { in: 3..250 }
    validates :cost_per_consult, presence: true, numericality: { only_integer: true, greater_than: 0 }
  
    def image_url
      Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end
  end