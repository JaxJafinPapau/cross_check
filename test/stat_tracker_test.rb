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

  def test_stat_tracker_object_has_games
    games = []
    test_game = Game.new({team_id: "2012030221", "20122013","P",2013-05-16,"3","6",2,3,"home win OT","left","TD Garden","/api/v1/venues/null","America/New_York",-4,"EDT"})
    assert_equal games, @stat_tracker.games
    assert_equal test_game, @stat_tracker.games.first  #Can't do this. this is bad
  end
  #assert instance of first/second, total number of games

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
