class Sell < ActiveRecord::Base
  belongs_to :product

  validates :price_total, numericality: { greater_than: 0 }
  validates :fee_total, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than: 0 }

  before_validation :calculate_totals

  def calculate_totals
    self.price_total = product.price * quantity
    self.fee_total = product.fee * quantity
  end

  def grand_total
    price_total + fee_total
  end
end
