require './lib/game'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'

class GameTest < Minitest::Test

  def setup
    categories = { game_id: "1",
                    season: "2",
                    type: "P",
                    date_time: 2013-05-16,
                    away_team_id: "23",
                    home_team_id: "644",
                    away_goals: 4,
                    home_goals: 7,
                    outcome: "home win OT",
                    home_rink_side_start: "left",
                    venue:"TD Garden",
  }
  @game = Game.new(categories)
  end

  def test_it_exsists

    assert_instance_of Game, @game
  end

  def test_it_attributes

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
  end
end
