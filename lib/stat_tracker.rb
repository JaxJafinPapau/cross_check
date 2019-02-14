require 'csv'
require 'pry'
require './lib/game'

class StatTracker
  attr_reader :games,
              :game_team_stats,
              :team_info

  def initialize(locations)
    @games = []
    # @game_team_stats = []
    # @team_info = []
    load_games(locations[:games])
  end

  def self.from_csv(locations)
    self.new(locations)
  end

  def load_games(file_path)
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      @games << Game.new(row)
    end
  end
end
