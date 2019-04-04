class Image < ApplicationRecord
  validates :url, presence: true, null: false, format: { with: URI.regexp(%w[http https]) }

  scope :recent, -> { order(created_at: :desc) }
end
