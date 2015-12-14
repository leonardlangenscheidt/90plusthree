json.array!(@leagues) do |league|
  json.extract! league, :id, :name, :endyear
  json.url league_url(league, format: :json)
end
