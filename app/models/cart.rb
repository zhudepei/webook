class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_book(book)
    current_item = line_items.find_by(book: book)
    if current_item
      current_item.plus!
    else
      current_item = line_items.build(book: book)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum(&:total_price) / 100.to_f
  end
end
