json.extract! concert, *(Concert.attribute_names - ['team_id', 'created_at', 'updated_at'])
json.team do
  json.partial! "api/teams/team", team: concert.team
end
