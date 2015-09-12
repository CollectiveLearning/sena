json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :fee, :quantity
  json.url product_url(product, format: :json)
end
