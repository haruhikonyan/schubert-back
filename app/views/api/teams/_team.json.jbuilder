json.extract! team, *(Team.attribute_names - ['password_digest', 'created_at', 'updated_at'])
json.types do
  # partial: 'api/types/type' を指定したい
  json.array! team.types, :id, :name
end
json.regions do
  # partial: 'api/regions/region' を指定したい
  json.array! team.regions, :id, :name
end
