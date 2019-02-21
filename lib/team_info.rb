class TeamInfo
  attr_reader :team_id,
              :franchise_id,
              :short_name,
              :team_name,
              :abbreviation,
              :link

  def initialize(categories)
    @team_id = categories["team_id"]
    @franchise_id = categories["franchiseId"]
    @short_name = categories["shortName"]
    @team_name = categories["teamName"]
    @abbreviation = categories["abbreviation"]
    @link = categories["link"]
  end
end
