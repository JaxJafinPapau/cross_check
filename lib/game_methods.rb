

module GameMethods

  def highest_total_goals
    games.map {|game| game.home_goals.to_i + game.away_goals.to_i}.max
  end

  def lowest_total_goals
    games.map {|game| game.home_goals.to_i + game.away_goals.to_i}.min
  end

  def biggest_difference
    games.map {|game| (game.home_goals.to_i - game.away_goals.to_i).abs}.max
  end

  def percentage_home_wins
    stat_a = games.count
    stat_b = games.map {|game| (game.home_goals.to_i - game.away_goals.to_i).abs}.max
    stat_b / stat_a.f * 100.00
  end
