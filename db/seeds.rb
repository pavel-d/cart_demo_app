discount_1 = Discount.create(threshold: 3, absolute_value: 20)
discount_2 = Discount.create(threshold: 2, relative_value: 50)

%w(BlackTea1 BlackTea2 BlackTea3).each do |name|
  Product.create(name: name, description: 'Lorem ipsum', price: 50, discount: discount_1)
end

Product.create(name: 'Coffee', description: 'Lorem ipsum', price: 100, discount: discount_2)
