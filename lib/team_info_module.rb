module TeamInfoModule
#gives all team attributes as values with corresponding category for keys
  def team_info(team_id)
    selected = @team_info_rows.find do |team|
      team_id == team.team_id
    end
  {"team_id" => selected.team_id,
   "franchiseid" => selected.franchise_id,
   "shortname" => selected.short_name,
   "teamname" => selected.team_name,
   "abbreviation" => selected.abbreviation,
   "link" => selected.link
   }
  end

  def best_season(team_id)
    seasons = games_by_season(games_by_team(team_id))
    best = seasons.values.max_by do |season|
      games_win_percentage(team_id, season)
    end
    best[0].season.to_i
  end

  def worst_season(team_id)
    seasons = games_by_season(games_by_team(team_id))
    worst = seasons.values.min_by do |season|
      games_win_percentage(team_id, season)
    end
    worst[0].season.to_i
  end

  def average_win_percentage(team_id)
    all_games = games_by_team(team_id)
    (games_win_percentage(team_id, all_games) * 100).round(2)
  end

  def most_goals_scored(team_id)
    goals_scored_by_team(team_id).max
  end

  def fewest_goals_scored(team_id)
    goals_scored_by_team(team_id).min
  end

  def favorite_opponent(team_id)
    #find all the games that team_id played agaist given opponnent
    games = games_by_team(team_id)
    wins_by_opposing_team = []
    losses_by_opposing_team = []
    games.each do |game|
      if team_id == game.away_team_id && game.outcome.match?(/away win/)
        wins_by_opposing_team << game.home_team_id
      elsif team_id == game.home_team_id && game.outcome.match?(/home win/)
        wins_by_opposing_team << game.away_team_id
      elsif team_id == game.away_team_id && game.outcome.match?(/home win/)
        losses_by_opposing_team << game.home_team_id
      else team_id == game.home_team_id && game.outcome.match?(/away win/)
        losses_by_opposing_team << game.away_team_id
      end
    end
    favorite_team_id = wins_by_opposing_team.max_by do |id|
      wins_by_opposing_team.count(id) / (wins_by_opposing_team.count(id) + losses_by_opposing_team.count(id))
    end
    team_id_converter(favorite_team_id)
  end
#takes a team_id number and converts it to teamname
  def team_id_converter(team_id_number)
    favorite_team_row = @team_info_rows.find do |row|
      row.team_id == team_id_number
    end
    favorite_team_row.team_name
  end
#organizes a given set of games by season_id
  def games_by_season(set_of_games)
    seasons = set_of_games.group_by do |game|
      game.season
    end
  end
#organizes games by team
  def games_by_team(team_id)
    team_games = @games.find_all do |game|
      team_id == game.home_team_id || team_id == game.away_team_id
    end
    team_games
  end
#determines a win percentage by a given team and given a collection of Game objects
  def games_win_percentage(team_id, games)
    total = games.count
    won = 0
    games.each do |game|
      if (team_id == game.away_team_id) && game.outcome.match?(/away win/)
        won += 1
      elsif (team_id == game.home_team_id) && game.outcome.match?(/home win/)
        won += 1
      else
        won += 0
      end
    end
    won.to_f / total
  end
#determines the goals scored by a given team in each game and returns
# goal tallies in an array
  def goals_scored_by_team(team_id)
    goals_scored = []
    games_by_team(team_id).each do |game|
      if team_id == game.away_team_id
        goals_scored << game.away_goals.to_i
      else team_id == game.home_team_id
        goals_scored << game.home_goals.to_i
      end
    end
    goals_scored
  end
end
