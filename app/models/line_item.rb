# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  def total_price
    book.price * quantity
  end

  def plus!
    increment! :quantity
  end

  def minus!
    decrement! :quantity if quantity > 1
  end
end
