require 'Date'
class Animal

  attr_accessor :nombre, :edad, :fecha_nacimiento

  def initialize(options = {})
    options.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def sonido
    nil
  end

  def to_s
    "#{self.nombre} tiene #{self.edad} años y hace #{self.sonido}"
  end

end
