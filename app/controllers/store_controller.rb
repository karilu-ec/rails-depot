class StoreController < ApplicationController
  skip_before_action :authorize
  include StoreCounter
  include CurrentCart
  before_action :counter_set, only: [:index]
  before_action :set_cart
  
  def index
    @products = Product.order(:title)
    @mytime = Time.now
    @count = session[:counter]  
    @message_counter = "You have accessed the application #{@count} times"  if @count > 5
    @checkout = false
  ## this was part of my solution to not display the cart on the left
  ##@cartemptyFlag = @cart.find_products(@cart.id)
  end
  
end
