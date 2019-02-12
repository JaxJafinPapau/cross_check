require 'csv'

class StatTracker

  # def initialize
  #
  # end

  def self.from_csv(file)
    CSV.read(file)
  end

  def highest_total_score(game_file)
    all_scores = []
    CSV.foreach(game_file) do |game|
      total_score = game[6].to_i + game[7].to_i
      all_scores << total_score
    end
    all_scores.max
  end
end
