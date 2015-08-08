# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  quantity   :integer          default("0")
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  validates :cart_id, presence: true
  validates :product_id, presence: true

  delegate :discount, to: :product

  def sub_total
    product.price * quantity
  end
end
