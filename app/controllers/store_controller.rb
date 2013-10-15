class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @mytime = Time.now
  end
  
end
