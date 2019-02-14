require './lib/stat_tracker'

class GameTeamStats
  attr_reader :game_id,
              :team_id,
              :hoa,
              :won,
              :settled_in,
              :head_coach,
              :goals,
              :shots,
              :hits,
              :pim,
              :powerPlayOpportunities,
              :powerPlayGoals,
              :faceOffWinPercentage,
              :giveaways,
              :takeaways

  def initialize(categories)
    @game_id = categories[:game_id]
    @team_id = categories[:team_id]
    @hoa = categories[:hoa]
    @won = categories[:won]
    @settled_in = categories[:settled_in]
    @head_coach = categories[:head_coach]
    @goals = categories[:goals]
    @shots = categories[:shots]
    @hits = categories[:hits]
    @pim = categories[:pim]
    @powerPlayOpportunities = categories[:powerPlayOpportunities]
    @powerPlayGoals = categories[:powerPlayGoals]
    @faceOffWinPercentage = categories[:faceOffWinPercentage]
    @giveaways = categories[:giveaways]
    @takeaways = categories[:takeaways]
  end
end
