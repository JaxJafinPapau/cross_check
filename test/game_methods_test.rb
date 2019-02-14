require './lib/stat_tracker'
require './lib/game_methods'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'

class GameMethodsTest < Minitest::Test

  def setup
    game_path = './data/fixture_game.csv'
    team_path = './data/fixture_team_info.csv'
    game_teams_path = './fixture_data/game_teams_stats.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }

    @stat_tracker = StatTracker.from_csv(locations)

  end

  def test_highest_total_goals
    assert_equal 7, @stat_tracker.highest_total_goals
  end

  def test_lowest_total_goals
    assert_equal 3, @stat_tracker.lowest_total_goals
  end

  def test_biggest_blowout
    assert_equal 3, @stat_tracker.biggest_difference
  end

  def test_percentage_home_wins?
    assert_equal 66.67, @stat_tracker.percentage_home_won
  end
