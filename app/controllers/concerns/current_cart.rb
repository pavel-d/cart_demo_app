module CurrentCart
  extend ActiveSupport::Concern

  included do
    before_action :current_cart
    helper_method :current_cart
  end

  def current_cart
    @cart ||= Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
    @cart
  end
end
