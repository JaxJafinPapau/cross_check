require './lib/stat_tracker'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/mather'
require 'csv'

class StatTrackerTest < Minitest::Test
  def setup
    @game_test_file = './data/fixture_game.csv'
    # team_test_path = './data/fixture_team_info.csv'
    # game_teams_test_path = './data/fixture_game_teams_stats.csv'
    @stat_tracker = StatTracker.new
  end

  def test_stat_tracker_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  def test_stat_tracker_can_get_csv_files
    assert_equal "game_id", StatTracker.from_csv(@game_test_file).first.first
  end

  def test_stat_tracker_has_highest_total_score
    assert_equal 7, @stat_tracker.highest_total_score(@game_test_file)
  end

  def test_stat_tracker_has_lowest_total_score
    assert_equal 3, @stat_tracker.lowest_total_score(@game_test_file)
  end

  def test_stat_tracker_gives_biggest_blowout
    assert_equal 3, @stat_tracker.biggest_blowout(@game_test_file)
  end

  def test_stat_tracker_gives_percentage_home_wins
    skip
    assert_equal 66.67, @stat_tracker.percentage_home_wins(@game_test_file)
  end
end
