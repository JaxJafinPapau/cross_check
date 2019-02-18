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
    home_win_bools = games.map {|game| game.outcome.match?(/home win/)}
    stat_b = home_win_bools.count(true)
    (stat_b / stat_a.to_f * 100.00).round(2)
  end

  def percentage_away_wins
    stat_a = games.count
    home_win_bools = games.map {|game| game.outcome.match?(/away win/)}
    stat_b = home_win_bools.count(true)
    (stat_b / stat_a.to_f * 100.00).round(2)
  end

  def count_of_games_by_season
    games_by_season = @games.group_by { |game| game.season }
    games_by_season.each { |season, games| games_by_season[season] = games.count }
  end

  def average_goals_per_game #across all seasons
    goals = games.map {|game| game.home_goals.to_i + game.away_goals.to_i}.sum
    (goals / games.count.to_f)
  end

  def average_goals_by_season
    goals_by_season = @games.group_by { |game| game.season }
    goals_by_season.each do |season, games|
    goals = games.map {|game| game.home_goals.to_i + game.away_goals.to_i}.sum
    goals_by_season[season] = (goals.to_f / games.count.to_f).round(2)
    end
  end
end
