json.array!(@statistics) do |statistic|
  json.extract! statistic, :id, :number, :quantity
  json.url statistic_url(statistic, format: :json)
end
