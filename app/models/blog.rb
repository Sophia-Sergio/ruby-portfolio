class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :comments, dependent: :destroy

  scope :last_updated, -> { order('updated_at DESC') }
end
