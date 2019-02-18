require './test/test_helper.rb'

class GameMethodsTest < Minitest::Test

  def setup
    game_path = './data/fixture_game.csv'
    team_path = './data/fixture_team_info.csv'
    game_teams_path = './data/fixture_game_teams_stats.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }

    @stat_tracker = StatTracker.from_csv(locations)

  end

  def test_highest_total_goals?
    assert_equal 7, @stat_tracker.highest_total_goals
  end

  def test_lowest_total_goals?
    assert_equal 3, @stat_tracker.lowest_total_goals
  end

  def test_biggest_blowout?
    assert_equal 3, @stat_tracker.biggest_difference
  end

  def test_percentage_home_wins?
    assert_equal 66.67, @stat_tracker.percentage_home_wins
  end

  def test_percentage_away_wins?
    assert_equal 33.33, @stat_tracker.percentage_away_wins
  end

  def test_count_of_games_by_season?
    game_path = './data/fixture_game_2.csv'
    team_path = './data/fixture_team_info.csv'
    game_teams_path = './data/game_teams_stats.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }
    stat_tracker = StatTracker.from_csv(locations)

    expected = {"20122013"=>57, "20162017"=>4, "20142015"=>18, "20152016"=>16, "20132014"=>7}
    assert_equal expected, stat_tracker.count_of_games_by_season
  end


  def test_average_goals_per_game?
    assert_equal 5.0, @stat_tracker.average_goals_per_game
  end

  def test_average_goals_by_season?
    game_path = './data/fixture_game_2.csv'
    team_path = './data/fixture_team_info.csv'
    game_teams_path = './data/game_teams_stats.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }
    stat_tracker = StatTracker.from_csv(locations)

    expected = {"20122013"=>4.91, "20162017"=>5.75, "20142015"=>4.67, "20152016"=>4.88, "20132014"=>6.14}
    assert_equal expected, stat_tracker.average_goals_by_season
  end

end
