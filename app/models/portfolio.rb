class Portfolio < ApplicationRecord
  validates :title, :subttile, :body, :main_image, :thumb_image, presence: true
end
