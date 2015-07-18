require_relative 'animal'
require 'json'

class Perro < Animal
  def sonido
    'guau'
  end

  def self.all
    file.map do |item|
      new(item)
    end
  end

  def self.file
    file = File.read('perro.json')
    JSON.load file
  end
end
