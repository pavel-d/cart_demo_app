class CartItemsController < ApplicationController
  before_action :set_cart_item, except: [:create]

  def create
    cart_item = CartItem.find_or_initialize_by(
      cart_id: current_cart.id,
      product_id: params[:product_id]
    )

    cart_item.update(quantity: cart_item.quantity + 1)

    respond_to do |format|
      format.js { render 'cart' }
    end
  end

  def increase
    @cart_item.update(quantity: @cart_item.quantity + 1)

    respond_to do |format|
      format.js { render 'cart' }
    end
  end

  def decrease
    if @cart_item.quantity == 1
      @cart_item.destroy
    else
      @cart_item.update(quantity: @cart_item.quantity - 1)
    end

    respond_to do |format|
      format.js { render 'cart' }
    end
  end

  def destroy
    @cart_item.destroy

    respond_to do |format|
      format.js { render 'cart' }
    end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
