class PayType < ActiveRecord::Base
  has_many :orders
  
  def translated_name
    I18n.t(name, :scope => 'paytype')
  end
  
end
