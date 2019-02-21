require './test/test_helper'

class LeagueMethodsTest < Minitest::Test

  def setup
    game_path = './data/fixture_game.csv'
    team_path = './data/fixture_team_info_2.csv'
    game_teams_path = './data/fixture_game_teams_stats.csv'

    locations = {
      games: game_path,
      team_info: team_path,
      game_team_stats: game_teams_path
    }

    @stat_tracker = StatTracker.from_csv(locations)
  end

  def test_total_number_of_teams
    assert_equal 2, @stat_tracker.total_number_of_teams
  end

  def test_best_offense
    assert_equal "Bruins", @stat_tracker.best_offense
  end

  def test_worst_offense
    assert_equal "Rangers", @stat_tracker.worst_offense
  end

  def test_best_defense
    assert_equal "Bruins", @stat_tracker.best_defense
  end

  def test_worst_defense
    assert_equal "Rangers", @stat_tracker.worst_defense
  end

  def test_highest_scoring_visitor
    expected = "Bruins" #getting bruins because data set too small they are tied
    assert_equal expected, @stat_tracker.highest_scoring_visitor
  end

  def test_highest_scoring_home_team
    assert_equal "Bruins", @stat_tracker.highest_scoring_home_team
  end

end
