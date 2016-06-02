json.array!(@provisors) do |provisor|
  json.extract! provisor, :id, :name, :surname, :fathername, :birthday, :inn, :passport, :pharmacy_id
  json.url provisor_url(provisor, format: :json)
end
