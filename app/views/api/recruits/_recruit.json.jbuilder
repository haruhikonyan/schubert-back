json.extract! recruit, *(Recruit.attribute_names - ['team_id', 'concert_id', 'created_at', 'updated_at'])
json.team do
  json.partial! "api/teams/team", team: recruit.team
end
json.instruments do
  json.partial! 'api/instruments/instrument', collection: recruit.instruments, as: :instrument
end
json.concert do
  json.partial! 'api/concerts/concert', concert: recruit.concert if recruit.concert.present?
end 
