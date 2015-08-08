class Discounter
  attr_reader :cart, :products, :discounts, :regular_price

  def initialize(cart)
    @cart = cart
    @products = cart.cart_items.map(&:product)
    @discounts = @products.map(&:discount).compact.uniq
    @regular_price = cart.regular_price
  end

  def discount_amount
    amount = 0
    discounts.each do |discount|
      if applies?(discount)
        amount += (regular_price * discount.relative_value / 100) + discount.absolute_value
      end
    end
    amount
  end

  private

  def applies?(discount)
    count = cart.cart_items.joins(:product)
               .where(products: { discount_id: discount.id })
               .map(&:quantity).reduce(:+)

    return true if count >= discount.threshold
    false
  end
end
