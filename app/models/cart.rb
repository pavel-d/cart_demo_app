# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ActiveRecord::Base
  has_many :cart_items

  def total_price
    regular_price - discount_amount
  end

  def regular_price
    @regular_price ||= cart_items.map(&:sub_total).reduce(:+)
  end

  def discount_amount
    discounter.discount_amount
  end

  def disounted?
    discount_amount > 0
  end

  def discounter
    @discounter ||= Discounter.new(self)
  end
end
