json.extract! team, *(Team.attribute_names - ['password_digest', 'created_at', 'updated_at'])
json.types do
  json.partial! 'api/types/type', collection: team.types, as: :type
end
json.regions do
  json.partial! 'api/regions/region', collection: team.regions, as: :region
end
