json.array!(@users) do |user|
  json.extract! user, :id, :name, :last_name, :address, :gender, :phone, :card_id, :email, :password_digest, :identification_type
  json.url user_url(user, format: :json)
end
