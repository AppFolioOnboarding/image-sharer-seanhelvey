class Image < ApplicationRecord
  acts_as_taggable # Alias for acts_as_taggable_on :tags

  validates :url, presence: true, null: false, format: { with: URI.regexp(%w[http https]) }

  scope :recent, -> { order(created_at: :desc) }
end
