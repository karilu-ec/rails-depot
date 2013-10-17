class CombineItemsInCart < ActiveRecord::Migration
  def up
    #replace multiple items for a single product in a cart with a single item
    Cart.all.each do |cart|
      #count the number of each product in the cart
      sums = cart.line_items.group(:product_id).sum(:quanty)
      
      sums.each do |product_id, quantity|
        #remove the individual items
        cart.line_items.where(product_id: product_id).delete_all
        
        #replace with a single item
        item = cart.line_items.build(product_id: product_id)
        item.quanty = quantity
        item.save!
      end
      
    end
    
  end
  
  def down
    #split items with quantity > 1 into multiple items
    LineItem.where("quanty>1").each do |line_item|
      #add individual items
      line_item.quanty.times do
        LineItem.create cart_id: line_item.cart_id, product_id: line_item.product_id, quanty: 1
      end
      #remove the original item
      line_item.destroy
    end
  end
  
  
end
