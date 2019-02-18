require './test/test_helper'

class GameTest < Minitest::Test

  def setup
    categories = {  team_id: "1",
                    franchiseid: "23",
                    shortname: "New Jersey",
                    teamname: "Devils",
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
    assert_equal "23", @team_info.franchiseid
    assert_equal "New Jersey", @team_info.shortname
    assert_equal "Devils", @team_info.teamname
    assert_equal "NJD", @team_info.abbreviation
    assert_equal "/api/v1/teams/1", @team_info.link
  end
end
