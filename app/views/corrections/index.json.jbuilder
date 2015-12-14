json.array!(@corrections) do |correction|
  json.extract! correction, :id, :name, :link, :match_id, :type, :change, :minute, :mirror
  json.url correction_url(correction, format: :json)
end
