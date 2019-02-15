require './lib/team_info'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'

class GameTest < Minitest::Test

  def setup
    categories = {  team_id: "1",
                    franchiseId: "23",
                    shortName: "New Jersey",
                    teamName: "Devils",
                    abbreviation: "NJD",
                    link: "/api/v1/teams/1"
                  }
  @team_info = TeamInfo.new(categories)
  end

  def test_it_exsists
    assert_instance_of TeamInfo, @team_info
  end

  def test_it_attributes
    assert_equal "1", @team_info.team_id
    assert_equal "23", @team_info.franchiseId
    assert_equal "New Jersey", @team_info.shortName
    assert_equal "Devils", @team_info.teamName
    assert_equal "NJD", @team_info.abbreviation
    assert_equal "/api/v1/teams/1", @team_info.link
  end
end
