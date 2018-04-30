json.extract! recruit, *(Recruit.attribute_names - ['team_id', 'created_at', 'updated_at'])
json.team do
  json.partial! "api/teams/team", team: recruit.team
end
json.instruments do
  # partial: 'api/instruments/instrument' を指定したい
  json.array! recruit.instruments, :id, :name, :short_name
end
