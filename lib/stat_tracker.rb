require 'csv'
require 'pry'
require './lib/mather'

class StatTracker
  include Mather

  # def initialize(file_path)
  #   @data_set = file_path
  # end

  def self.from_csv(file)
    CSV.read(file)
  end

  def highest_total_score(game_file)
    high_scores = adder(game_file, 6, 7)
    high_scores.max
  end

  def lowest_total_score(game_file)
    low_scores = adder(game_file, 6, 7)
    low_scores.drop(1).min
  end

  def method_name

  end
end
