class Image < ApplicationRecord
  validates :url, presence: true, null: false, format: { with: URI.regexp(%w[http https]) }
end
