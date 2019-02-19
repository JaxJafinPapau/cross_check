require './test/test_helper'

class LeagueMethodsTest < Minitest::Test

  def setup
    game_path = './data/fixture_game.csv'
    team_path = './data/fixture_team_info.csv'
    game_teams_path = './data/fixture_game_teams_stats.csv'

    locations = {
      games: game_path,
      team_info: team_path,
      game_team_stats: game_teams_path
    }

    @stat_tracker = StatTracker.from_csv(locations)
  end

  def test_total_number_of_teams
    assert_equal 6, @stat_tracker.total_number_of_teams
  end

  def test_best_offense
    assert_equal " ", @stat_tracker.best_offense
  end

end
