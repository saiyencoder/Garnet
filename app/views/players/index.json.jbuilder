json.array! @players.each do |player|
  json.id player.id
  json.name player.name
  json.team player.team.name
  json.stats player.stats
end