class CartsController < ApplicationController
  def show
    @cart_items = CartItem.includes(:product).all
    @subtotal = @cart_items.sum { |item| item.product.price * item.quantity }
    @discount = params[:discount]&.to_i || 0
    @discount = 1000 if @discount > 1000
    @total = [ @subtotal - @discount, 0 ].max
  end

  def reset
    CartItem.destroy_all
    redirect_to cart_path, notice: "Корзина очищена"
  end
end
