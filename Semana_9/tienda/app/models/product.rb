class Product < ActiveRecord::Base
  def self.to_buy
    where('quantity <= 3')
  end
end
