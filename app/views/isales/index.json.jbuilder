json.array!(@isales) do |isale|
  json.extract! isale, :id, :pharmacy_id, :provisor_id, :drug_id, :date_sale, :quantity
  json.url isale_url(isale, format: :json)
end
