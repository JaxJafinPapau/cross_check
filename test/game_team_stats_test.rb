require './test/test_helper'

class GameTeamStatsTest < Minitest::Test

  def setup
    categories = {
      "game_id" => "2012030221",
      "team_id" => "3",
      "hoa" => "away",
      "won" => "FALSE",
      "settled_in" => "OT",
      "head_coach" => "John Tortorella",
      "goals" => 2,
      "shots" => 35,
      "hits" => 44,
      "pim" => 8,
      "powerplayopportunities" => 3,
      "powerplaygoals" => 0,
      "faceoffwinpercentage" => 44.8,
      "giveaways" => 17,
      "takeaways" => 7
      }
    @game_team_stats = GameTeamStats.new(categories)
  end

  def test_game_team_goals_has_attributes
    assert_equal "2012030221", @game_team_stats.game_id
    assert_equal "3", @game_team_stats.team_id
    assert_equal "away", @game_team_stats.hoa
    assert_equal "FALSE", @game_team_stats.won
    assert_equal "OT", @game_team_stats.settled_in
    assert_equal "John Tortorella", @game_team_stats.head_coach
    assert_equal 2, @game_team_stats.goals
    assert_equal 35, @game_team_stats.shots
    assert_equal 44, @game_team_stats.hits
    assert_equal 8, @game_team_stats.pim
    assert_equal 3, @game_team_stats.powerplayopportunities
    assert_equal 0, @game_team_stats.powerplaygoals
    assert_equal 44.8, @game_team_stats.faceoffwinpercentage
    assert_equal 17, @game_team_stats.giveaways
    assert_equal 7, @game_team_stats.takeaways
  end
end
