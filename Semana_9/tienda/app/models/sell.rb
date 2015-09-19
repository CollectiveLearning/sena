class Sell < ActiveRecord::Base
  belongs_to :product

  validates :price_total, numericality: { greater_than: 0 }
  validates :fee_total, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than: 0 }
  validate :stock

  before_validation :calculate_totals
  before_create :update_product

  after_commit :publish_sell, on: :create

  def publish_sell
    RealTime.redis.publish('ventas', to_json)
  end

  def stock
    if product.quantity < quantity
      errors.add :stock, "Solo hay #{product.quantity} disponibles"
    end
  end

  def update_product
    product.quantity -= quantity
    product.save
  end

  def calculate_totals
    self.price_total = product.price * quantity
    self.fee_total = product.fee * quantity
  end

  def grand_total
    price_total + fee_total
  end

  def self.latest_sells
    order(created_at: :desc).last(10)
  end

end
