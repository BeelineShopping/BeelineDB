json.array!(@stores) do |store|
  json.extract! store, :id, :name, :city, :state
  json.url store_url(store, format: :json)
end
