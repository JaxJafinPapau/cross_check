require './lib/stat_tracker'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'

class StatTrackerTest < Minitest::Test
  def setup
    @test_locations = {
      games: './data/fixture_game.csv',
      team_info: './data/fixture_team_info.csv',
      game_team_stats: './data/fixture_game_teams_stats.csv'
    }
    @stat_tracker = StatTracker.from_csv(@test_locations)
  end

  def test_stat_tracker_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  def test_stat_tracker_has_games
    assert_equal 3, @stat_tracker.games.count
    assert_instance_of Game, @stat_tracker.games[0]
  end

  def test_stat_tracker_has_game_team_stats
    assert_equal 6, @stat_tracker.game_team_stats.count
    assert_instance_of GameTeamStats, @stat_tracker.game_team_stats[0]
  end

  def test_stat_tracker_has_team_info
    assert_equal 6, @stat_tracker.team_info.count
    assert_instance_of TeamInfo, @stat_tracker.team_info[0]
  end

  # def test_highest_total_score
  #   game_1 = Game.new({away_goals: 3, home_goals: 1})
  #   game_2 = Game.new({away_goals: 3, home_goals: 1})
  #   game_3 = Game.new({away_goals: 3, home_goals: 1})
  #   game_4 = Game.new({away_goals: 3, home_goals: 1})
  #   game_5 = Game.new({away_goals: 3, home_goals: 1})
  #   games = [game_1, game_2, game_3, game_4, game_5]
  #   stat_tracker = StatTracker.new(games)
  #   assert_equal 4, stat_tracker.highest_total_score
  # end

  # Test that after you call StatTracker.from_csv,
  # the new StatTracker object is loaded with the correct games

  # def test_stat_tracker_exists
  #   assert_instance_of StatTracker, @stat_tracker
  # end
  #
  # def test_stat_tracker_can_get_csv_files
  #   assert_equal "game_id", StatTracker.from_csv(@game_test_file).first.first
  # end
  # def test_stat_tracker_has_highest_total_score
  #   assert_equal 7, @stat_tracker.highest_total_score(@game_test_file)
  # end
  #
  # def test_stat_tracker_has_lowest_total_score
  #   assert_equal 3, @stat_tracker.lowest_total_score(@game_test_file)
  # end
  #
  # def test_stat_tracker_gives_biggest_blowout
  #   assert_equal 3, @stat_tracker.biggest_blowout(@game_test_file)
  # end
  #
  # def test_stat_tracker_gives_percentage_home_wins
  #   assert_equal 66.67, @stat_tracker.percentage_home_wins(@game_test_file)
  # end
end
