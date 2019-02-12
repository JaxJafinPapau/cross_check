require 'csv'
require 'pry'
require './lib/mather'

class StatTracker
  include Mather

  def self.from_csv(file)
    CSV.read(file)
  end

  # def highest_total_score(game_file)
  #   high_scores = adder(game_file, 6, 7)
  #   high_scores.max
  # end
  #
  # def lowest_total_score(game_file)
  #   low_scores = adder(game_file, 6, 7)
  #   low_scores.drop(1).min
  # end
  #
  # def biggest_blowout(game_file)
  #   blowouts = differencer(game_file, 6, 7)
  #   blowouts.max
  # end

  # def percentage_home_wins(game_file)
  #   total_games = CSV.read(game_file).count
  #   home_game_wins = element_counter(game_file, "home win")
  #   percentager(total_games, home_game_wins)
  # end
  #
  # def matching_element_counter(game_file, string)
  #   x = CSV.foreach(game_file) do |element|
  #     element.match(string)
  #   end
  #   x.count
  # end
end
