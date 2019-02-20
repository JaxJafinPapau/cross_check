require './test/test_helper'

class GameTest < Minitest::Test
  def setup
    categories = {"game_id" => "1",
                  "season" => "2",
                  "type" => "P",
                  "date_time" => 2013-05-16,
                  "away_team_id" => "23",
                  "home_team_id" => "644",
                  "away_goals" => 4,
                  "home_goals" => 7,
                  "outcome" => "home win OT",
                  "home_rink_side_start" => "left",
                  "venue" => "TD Garden",
                  "venue_link" => "/api/v1/venues/null",
                  "venue_time_zone_id" => "America/New_York",
                  "venue_time_zone_offset" => -4,
                  "venue_time_zone_tz" => "EDT"
                  }
    @game = Game.new(categories)
  end


  def test_it_exsists
    assert_instance_of Game, @game
  end

  def test_it_has_attributes
    assert_equal "1", @game.game_id
    assert_equal "2", @game.season
    assert_equal "P", @game.type
    assert_equal 2013-05-16, @game.date_time
    assert_equal "23", @game.away_team_id
    assert_equal "644", @game.home_team_id
    assert_equal 4, @game.away_goals
    assert_equal 7, @game.home_goals
    assert_equal "home win OT", @game.outcome
    assert_equal "left", @game.home_rink_side_start
    assert_equal "TD Garden", @game.venue
    assert_equal "/api/v1/venues/null", @game.venue_link
    assert_equal "America/New_York", @game.venue_time_zone_id
    assert_equal -4, @game.venue_time_zone_offset
    assert_equal "EDT", @game.venue_time_zone_tz
  end
end
