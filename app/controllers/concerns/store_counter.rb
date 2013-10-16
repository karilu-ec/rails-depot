module StoreCounter
  extend ActiveSupport::Concern
  private
  
  def counter_set
    if session[:counter].nil?
      session[:counter] = 0
    end
      session[:counter] += 1    
  end
end
