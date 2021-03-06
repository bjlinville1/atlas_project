json.array!(@regions) do |region|
  json.extract! region, :id, :name, :description, :climate, :country_id
  json.url region_url(region, format: :json)
end
