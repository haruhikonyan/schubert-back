json.extract! recruit, *(Recruit.attribute_names - ['team_id', 'created_at', 'updated_at'])
json.team do
  json.partial! "api/teams/team", team: recruit.team
end
json.instruments do
  # json.array! @instruments, partial: 'api/instruments/instrument', as: :instrument
  # こんな感じにしたいがエラー出る
  json.array! recruit.instruments
end
