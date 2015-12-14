json.array!(@matches) do |match|
  json.extract! match, :id, :week, :real_result1, :real_result2, :league_id
  json.url match_url(match, format: :json)
end
