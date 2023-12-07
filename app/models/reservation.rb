class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
