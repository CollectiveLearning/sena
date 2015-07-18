require_relative 'animal'

class Elefante < Animal
  def sonido
    'fuuuuuu'
  end

  def self.all
    file.map do |item|
      new(item)
    end
  end

  def self.file
    file = File.read('elefante.json')
    JSON.load file
  end
end
