require 'csv'
require 'pry'

class StatTracker

  # def initialize
  #
  # end

  def self.from_csv(file)
    CSV.read(file)
  end

  def highest_total_score(game_file)
    high_scores = []
    CSV.foreach(game_file) do |game|
      total_score = game[6].to_i + game[7].to_i
      high_scores << total_score
    end
    high_scores.max
  end

  def lowest_total_score(game_file)
    low_scores = []
    CSV.foreach(game_file) do |game|
      total_score = game[6].to_i + game[7].to_i
      low_scores << total_score
    end
    low_scores.drop(1).min
  end
end
