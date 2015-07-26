require 'json'
require 'byebug'
require 'httparty'


class Wrapper

  def initialize(options = {})
    options.each do |key, val|
      self.send("#{key}=", val)
    end
  end

  # Perform a HTTP request to the API server, it change dynamically the endpoint based
  # in the class name
  # Example
  # Empleado.get
  # => [{"id"=>1, "nombre"=>"Ruben"}, {"id"=>2, "nombre"=>"Alejandro"}, {"id"=>3, "nombre"=>"Yonatan"}]
  # Return => parsed JSON response
  def self.get
    url = "http://localhost:4567/#{self.to_s.downcase}"
    HTTParty.get(url).parsed_response
  end

  # Return all the elements of a collection, it reads the data from a
  # JSON API
  # Example
  # Empleado.all
  #  => [#<Empleado:0x007feeaa1da628 @id=1, @nombre="Ruben">,
  #      #<Empleado:0x007feeaa1da4e8 @id=2, @nombre="Alejandro">,
  #      #<Empleado:0x007feeaa1d9fe8 @id=3, @nombre="Yonatan">]
  # Return => Array of objects
  def self.all
    get.map do |item|
     new(item)
    end
  end

  # Find an element by id
  # Example
  # Empleado.find(1)
  # return => Object or nil
  def self.find(id = '')
    all.find do |item|
      item.id == id
    end
  end

  # Find an element by column name
  # Example
  # Empleado.find_by(:nombre, 'Ruben')
  # Empleado.find_by(:edad, 'Ruben')
  # return => Object or nil
  def self.find_by(field, pattern)
    all.find do |item|
      item.send(field) == pattern
    end
  end
end