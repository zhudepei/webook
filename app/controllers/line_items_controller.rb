# frozen_string_literal: true

class LineItemsController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:create, :destroy]
  before_action :set_line_item, only: [:destroy]

  def plus
    @line_item = LineItem.find params[:id]
    if @line_item
      @line_item.plus!
      respond_to do |format|
        format.html { redirect_to @line_item.cart }
        format.js
      end
    end
  end

  def minus
    @line_item = LineItem.find params[:id]
    if @line_item
      @line_item.minus!
      respond_to do |format|
        format.html { redirect_to @line_item.cart }
        format.js
      end
    end
  end

  def create
    book       = Book.find params[:book_id]
    @line_item = @cart.add_book(book)

    if @line_item.save
      redirect_to @line_item.cart
    else
      redirect_to book
    end
  end

  def destroy
    @line_item.destroy

    redirect_to @cart
  end

  private

    def set_line_item
      @line_item = LineItem.find params[:id]
    end

end
