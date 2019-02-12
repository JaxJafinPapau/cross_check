require './lib/game_stats'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/mather'
require 'csv'

class GameStatsTest < Minitest::Test

  def setup
    @game_stats = GameStats.new
    @game_test_file = CSV.read('./data/fixture_game.csv')
  end

  def test_stat_tracker_has_highest_total_score
    assert_equal 7, @game_stats.highest_total_score(@game_test_file)
  end

  def test_stat_tracker_has_lowest_total_score
    assert_equal 3, @game_stats.lowest_total_score(@game_test_file)
  end

  def test_stat_tracker_gives_biggest_blowout
    assert_equal 3, @game_stats.biggest_blowout(@game_test_file)
  end

end
