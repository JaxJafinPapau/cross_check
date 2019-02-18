require './lib/stat_tracker'

game_path = './data/fixture_game.csv'
team_path = './data/fixture_team_info.csv'
game_teams_path = './fixture_data/game_teams_stats.csv'

locations = {
  games: game_path,
  teams: team_path,
  game_teams: game_teams_path
}

stat_tracker = StatTracker.from_csv(locations)

require 'pry'; binding.pry
