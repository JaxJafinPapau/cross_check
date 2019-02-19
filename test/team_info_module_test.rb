require './test/test_helper'

class TeamInfoModuleTest < Minitest::Test
  def setup
    @test_locations = {
      games: './data/fixture_game_3.csv',
      teams: './data/team_info.csv',
      game_teams: './data/fixture_game_teams_stats.csv'
    }
    @stat_tracker = StatTracker.from_csv(@test_locations)
  end

  def test_team_info_creates_info_hash
    expected = {team_id: "1",
                franchiseid: "23",
                shortname: "New Jersey",
                teamname: "Devils",
                abbreviation: "NJD",
                link: "/api/v1/teams/1"
                }
    assert_equal expected, @stat_tracker.team_info("1")
  end

  def test_team_can_find_best_season
    assert_equal 5, @stat_tracker.games_by_team("1").count
    assert_equal "away win REG", @stat_tracker.games_by_team("1")[0].outcome
    assert_equal 20132014, @stat_tracker.best_season("1")
  end

  def test_team_can_find_worst_season
     assert_equal 20122013, @stat_tracker.worst_season("1")
  end

  def test_team_can_find_win_percentage_across_all_games
    assert_equal 80.00, @stat_tracker.average_win_percentage("1")
  end

  def test_team_can_find_most_goals_scored
    assert_equal 5, @stat_tracker.most_goals_scored("1")
  end

  def test_team_can_find_fewest_goals_scored
    assert_equal 2, @stat_tracker.fewest_goals_scored("1")
  end

  def test_team_can_find_favorite_opponent
    assert_equal "Islanders", @stat_tracker.favorite_opponent("1")
  end

  def method_name

  end
end
