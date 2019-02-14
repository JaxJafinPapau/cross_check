require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_team_stats'
require 'csv'

class GameTeamStatsTest < Minitest::Test

  def setup
    categories = {
      game_id: "2012030221",
      team_id: "3",
      hoa: "away",
      won: "FALSE",
      settled_in: "OT",
      head_coach: "John Tortorella",
      goals: 2,
      shots: 35,
      hits: 44,
      pim: 8,
      powerPlayOpportunities: 3,
      powerPlayGoals: 0,
      faceOffWinPercentage: 44.8,
      giveaways: 17,
      takeaways: 7
      }
    @game_team_stats = GameTeamStats.new(categories)
  end
