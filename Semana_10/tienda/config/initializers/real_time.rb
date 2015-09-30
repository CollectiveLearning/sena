class RealTime
  def self.redis
    @redis ||= Redis.new
  end
end