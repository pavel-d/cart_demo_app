# == Schema Information
#
# Table name: discounts
#
#  id             :integer          not null, primary key
#  absolute_value :decimal(, )
#  relative_value :decimal(, )
#  threshold      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Discount < ActiveRecord::Base
  has_many :products

  validates :relative_value, numericality: { greater_than_or_equal: 0, less_than_or_equal: 100 }
  validates :absolute_value, numericality: { greater_than_or_equal: 0 }
  validates :threshold, numericality: { greater_than_or_equal: 0 }

  def human_description
    if absolute_value > 0 && relative_value > 0 # Doesn't make much sense, but let it be here...
      "Buy #{threshold} of kind and get #{relative_value}% and #{absolute_value}$ off"
    elsif absolute_value > 0
      "Buy #{threshold} of kind and get #{absolute_value}$ off"
    elsif relative_value > 0
      "Buy #{threshold} of kind and get #{relative_value}% off"
    end
  end
end
