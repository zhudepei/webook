class Book < ApplicationRecord
  has_one_attached :image

  scope :latest_books, -> { order(published_at: :desc).take(8) }
end
