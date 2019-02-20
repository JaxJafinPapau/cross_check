class TeamInfo
  attr_reader :team_id,
              :franchiseid,
              :shortname,
              :teamname,
              :abbreviation,
              :link

  def initialize(categories)
    @team_id = categories["team_id"]
    @franchiseid = categories["franchiseId"]
    @shortname = categories["shortName"]
    @teamname = categories["teamName"]
    @abbreviation = categories["abbreviation"]
    @link = categories["link"]
  end
end
