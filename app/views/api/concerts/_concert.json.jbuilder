json.extract! concert, *(Concert.attribute_names - ['team_id', 'created_at', 'updated_at'])
json.team do
  json.partial! "api/teams/team", team: concert.team
end
json.conductors do
  json.partial! 'api/conductors/conductor', collection: concert.conductors, as: :conductor
end
json.hole do
  json.partial! 'api/holes/hole', hole: concert.hole
end
