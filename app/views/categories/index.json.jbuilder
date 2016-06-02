json.array!(@categories) do |category|
  json.extract! category, :id, :name, :new_drug, :dest_drug
  json.url category_url(category, format: :json)
end
