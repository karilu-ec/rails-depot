class StoreController < ApplicationController
  include StoreCounter
  before_action :counter_set, only: [:index]
  
  def index
    @products = Product.order(:title)
    @mytime = Time.now
    @count = session[:counter]  
    @message_counter = "You have accessed the application #{@count} times"  if @count > 5 
  end
  
end
