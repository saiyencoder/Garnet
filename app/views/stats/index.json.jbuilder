json.array! @players.each do |player|
  json.id player.id
  json.name player.name
  json.stats player.stats.each do |stat|
    json.id stat.id
  end
end