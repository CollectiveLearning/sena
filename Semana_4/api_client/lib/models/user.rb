class User < Wrapper::Base

  attr_accessor :id, :name, :lastname, :gender,
                :age, :url, :address, :created_at, :updated_at

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
end