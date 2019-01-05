class Book < ApplicationRecord
  has_one_attached :image
  has_many :line_items

  scope :latest_books, -> { order(published_at: :desc).take(8) }

  def real_price
    price / 100.to_f
  end
end
