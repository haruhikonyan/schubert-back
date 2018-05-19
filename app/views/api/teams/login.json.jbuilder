json.token @token
json.team do
  json.partial! "api/teams/team", team: @team
end