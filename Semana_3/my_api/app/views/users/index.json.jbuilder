json.array!(@users) do |user|
  json.extract! user, :id, :name, :lastname, :address, :gender, :age
  json.url user_url(user, format: :json)
end
