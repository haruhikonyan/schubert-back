json.extract! hole, *(Hole.attribute_names - ['region_id', 'created_at', 'updated_at'])
json.region do
  json.partial! "api/regions/region", region: hole.region
end
