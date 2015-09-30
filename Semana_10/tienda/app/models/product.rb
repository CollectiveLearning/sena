class Product < ActiveRecord::Base

  after_commit :publish_to_buy
  after_create :publish_create_event
  after_update :publish_update_event
  after_destroy :publish_delete_event
  def publish_to_buy
    RealTime.redis.publish('compras', to_json) if quantity <= 3
  end

  def publish_create_event
    RealTime.redis.publish('products', {event: 'create', object: self}.to_json)
  end

  def publish_delete_event
    RealTime.redis.publish('products', {event: 'delete', object: self}.to_json)
  end

  def publish_update_event
    RealTime.redis.publish('products', {event: 'update', object: self}.to_json)
  end

  def self.to_buy
    where('quantity <= 3')
  end
end
