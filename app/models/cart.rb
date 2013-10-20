class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  def add_product(product_id, price)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quanty += 1
    else
      current_item = line_items.build(product_id: product_id, price: price)
    end
    current_item
  end
  
  # My solution for not displaying the empty cart.##
  #def find_products(cart_id)
  #  current_item = line_items.find_by(cart_id: cart_id)
  #  if current_item
  #    current_item
  #  else
  #    current_item = nil
  #  end
  #  current_item
  #end
  
  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end
  
end
