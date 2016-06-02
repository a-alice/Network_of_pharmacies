json.array!(@pharmacies) do |pharmacy|
  json.extract! pharmacy, :id, :address, :number, :subway
  json.url pharmacy_url(pharmacy, format: :json)
end
