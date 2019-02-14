require 'pry'
require './lib/stat_tracker'
class Game
  attr_reader :game_id,
              :season,
              :type,
              :date_time,
              :away_team_id,
              :home_team_id,
              :away_goals,
              :home_goals,
              :outcome,
              :home_rink_side_start,
              :venue,
              :venue_link,
              :venue_time_zone_id,
              :venue_time_zone_offset,
              :venue_time_zone_tz
  def initialize(categories)
    @game_id = categories[:game_id]
    @season = categories[:season]
    @type = categories[:type]
    @date_time = categories[:date_time]
    @away_team_id = categories[:away_team_id]
    @home_team_id = categories[:home_team_id]
    @away_goals = categories[:away_goals]
    @home_goals = categories[:home_goals]
    @outcome = categories[:outcome]
    @home_rink_side_start = categories[:home_rink_side_start]
    @venue = categories[:venue]
    @venue_link = categories[:venue_link]
    @venue_time_zone_id = categories[:venue_time_zone_id]
    @venue_time_zone_offset = categories[:venue_time_zone_offset]
    @venue_time_zone_tz = categories[:venue_time_zone_tz]
  end
end
