require './lib/game'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'

class GameTest < Minitest::Test

  def setup
    categories = {  team_id: "1",
                    franchiseId: "2",
                    shortName: "P",
                    teamName: 2013-05-16,
                    abbreviation: "23",
                    link: "644",
                  }
  @team_info = TeamInfo.new(categories)
  end

  def test_it_exsists
    assert_instance_of TeamInfo, @team_info
  end

  def test_it_attributes
    assert_equal "1", @game.team_id
    assert_equal "23", @game.franchiseId
    assert_equal "New Jersey", @game.shortName
    assert_equal "Devils", @game.teamName
    assert_equal "NJD", @game.abbreviation
    assert_equal "/api/v1/teams/1", @game.link
  end
end
