module CartHelper
  def show_cart_widget?
    params[:controller] != 'carts'
  end
end
