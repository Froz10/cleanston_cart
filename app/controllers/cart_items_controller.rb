class CartItemsController < ApplicationController
  def update
    @cart_item = CartItem.find_by(id: params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity])
    @cart_items = CartItem.includes(:product).all
    @subtotal = @cart_items.sum { |item| item.product.price * item.quantity }
    @discount = params[:discount]&.to_i || 0
    @total = [ @subtotal - @discount, 0 ].max

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @cart_item = CartItem.find_by(id: params[:id])
    @cart_item.destroy
    @cart_items = CartItem.includes(:product).all
    @subtotal = @cart_items.sum { |item| item.product.price * item.quantity }
    @discount = params[:discount]&.to_i || 0
    @total = [ @subtotal - @discount, 0 ].max

    respond_to do |format|
      format.turbo_stream
    end
  end
end
