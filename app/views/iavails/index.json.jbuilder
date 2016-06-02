json.array!(@iavails) do |iavail|
  json.extract! iavail, :id, :drug_id, :pharmacy_id, :quantity
  json.url iavail_url(iavail, format: :json)
end
