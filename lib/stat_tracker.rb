require 'csv'
require_relative './game_team_stats'
require_relative './game'
require_relative './team_info'
require_relative './game_methods'
require_relative './league_methods'
require_relative './team_info_module'

class StatTracker
  include GameMethods
  include LeagueMethods
  include TeamInfoModule

  attr_reader :games,
              :game_team_stats,
              :team_info_rows

  def initialize(locations)
    @games = []
    @game_team_stats = []
    @team_info_rows = []
  end

  def self.from_csv(locations)
    stat_tracker = new(locations)
    stat_tracker.load_games(locations[:games])
    stat_tracker.load_game_team_stats(locations[:game_teams])
    stat_tracker.load_team_info(locations[:teams])
    stat_tracker
  end

  def load_games(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      @games << Game.new(row)
    end
  end

  def load_game_team_stats(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      @game_team_stats << GameTeamStats.new(row)
    end
  end

  def load_team_info(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      @team_info_rows << TeamInfo.new(row)
    end
  end
end
