json.array! @teams.each do |team|
  json.id team.id
  json.team_name team.name
  json.players team.players
end