require './lib/stat_tracker'

class TeamInfo
  attr_reader :team_id,
              :franchiseId,
              :shortName,
              :teamName,
              :abbreviation,
              :link
  def initialize(categories)
    @team_id = categories[:team_id]
    @franchiseId = categories[:franchiseId]
    @shortName = categories[:shortName]
    @teamName = categories[:teamName]
    @abbreviation = categories[:abbreviation]
    @link = categories[:link]
  end
end
