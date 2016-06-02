json.array!(@drugs) do |drug|
  json.extract! drug, :id, :name, :volume, :dosage, :maker, :recipe, :new_category, :dest_category
  json.url drug_url(drug, format: :json)
end
