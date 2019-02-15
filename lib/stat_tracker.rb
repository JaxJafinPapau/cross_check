require 'csv'
require 'pry'
require './lib/game'
require './lib/game_team_stats'

class StatTracker
  attr_reader :games,
              :game_team_stats,
              :team_info

  def initialize(locations)
    @games = []
    @game_team_stats = []
    @team_info = []
  end

  def self.from_csv(locations)
    stat_tracker = new(locations)
    stat_tracker.load_games(locations[:games])
    stat_tracker.load_game_team_stats(locations[:game_team_stats])
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
      @team_info << TeamInfo.new(row)
    end
  end
end
