class User < Wrapper::Base

  attr_accessor :id, :name, :lastname, :gender,
                :age, :url, :address, :created_at, :updated_at

  def save
    HTTParty.post(HOST + '/users.json', body: to_json,
                  headers: {'Content-Type' => 'application/json'})
  end

  def to_json
    {user: {
        id: self.id,
        name: self.name,
        lastname: self.lastname,
        age: self.age,
        address: self.address,
        gender: self.gender
    }}.to_json
  end

  def self.all
    get('/users.json').map do |item|
      new(item)
    end
  end

  def self.find(id)
    new(get("/users/#{id}.json"))
  end


end