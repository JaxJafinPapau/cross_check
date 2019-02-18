require 'csv'
require 'pry'
require './lib/game'
require './lib/game_team_stats'
require './lib/team_info_module'

class StatTracker
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
    stat_tracker.load_game_team_stats(locations[:game_team_stats])
    stat_tracker.load_team_info(locations[:team_info])
    stat_tracker
  end

  def load_games(file_path)
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      @games << Game.new(row)
    end
  end

  def load_game_team_stats(file_path)
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      @game_team_stats << GameTeamStats.new(row)
    end
  end

  def load_team_info(file_path)
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      @team_info_rows << TeamInfo.new(row)
    end
  end
end
