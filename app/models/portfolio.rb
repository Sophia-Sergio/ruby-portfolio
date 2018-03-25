class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies
  validates :title, :subtitle, :body, presence: true
  # after_initialize :set_defaults

  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order('position ASC')
  end

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on rails') }

  # private

  # def set_defaults
  #   self.main_image ||= Placeholder.image_generator(height: 600, width: 400)
  #   self.thumb_image ||= Placeholder.image_generator(height: 350, width: 200)
  # end
end
