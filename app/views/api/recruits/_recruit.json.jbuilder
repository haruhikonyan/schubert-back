json.extract! recruit, *(Recruit.attribute_names - ['team_id', 'created_at', 'updated_at'])
json.team do
  json.partial! "api/teams/team", team: recruit.team
end
json.instruments do
  json.partial! 'api/instruments/instrument, collection: recruit.instruments, as: :instrument
end
