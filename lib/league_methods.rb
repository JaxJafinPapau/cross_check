require "pry"
require './lib/game_methods'

module LeagueMethods

  def total_number_of_teams
    team_info_rows.count
  end

  def best_offense
    average_scores = {}
    @team_info_rows.each do |team|
      x = @game_team_stats.select { |game| game.team_id == team.team_id }
      y = x.reduce(0) { |sum, n| sum + n.goals.to_i }
      average_score = y / games.count.to_f
      average_scores[team.teamname] = average_score
    end
    average_scores.max_by { |team, score| score }.first
  end

    # Name of the team with the highest average number of goals scored per game across all seasons.
  def worst_offense
      average_scores = {}
      @team_info_rows.each do |team|
        x = @game_team_stats.select { |game| game.team_id == team.team_id }
        y = x.reduce(0) { |sum, n| sum + n.goals.to_i }
        average_score = y / games.count.to_f
        average_scores[team.teamname] = average_score
      end
      average_scores.min_by { |team, score| score }.first
    end

  def best_defense
    goals_allowed = Hash.new(0)
       games_matches = @game_team_stats.group_by { |game| game.game_id}
       # x = @game_team_stats.select { |game| game.team_id == team.team_id }
       x = @game_team_stats.map {|game| game.team_id}

       games_matches.values.each { |pair| goals_allowed[pair[1].team_id] += pair[0].goals.to_i  }
       games_matches.values.each { |pair| goals_allowed[pair[0].team_id] += pair[1].goals.to_i  }
       y = goals_allowed.min_by {|team, values| values / (x.count(team)/2.0) }
       team_id_converter(y[0])

    #Name of the team with the lowest average number of goals allowed per game across all seasons.
  end

  def team_id_converter(team_id_number)
      favorite_team_row = @team_info_rows.find do |row|
        row.team_id == team_id_number
      end
      favorite_team_row.teamname
    end

  def worst_defense
    goals_allowed = Hash.new(0)
       games_matches = @game_team_stats.group_by { |game| game.game_id}
       # x = @game_team_stats.select { |game| game.team_id == team.team_id }
       x = @game_team_stats.map {|game| game.team_id}

       games_matches.values.each { |pair| goals_allowed[pair[1].team_id] += pair[0].goals.to_i  }
       games_matches.values.each { |pair| goals_allowed[pair[0].team_id] += pair[1].goals.to_i  }
       y = goals_allowed.max_by {|team, values| values / (x.count(team)/2.0) }
       team_id_converter(y[0])
    #Name of the team with the highest average number of goals allowed per game across all seasons.
  end

  def highest_scoring_visitor
    x = @game_team_stats.map do |game|
       game.hoa == "away"
       game.team_id
     end
    goals_scored_visitor = Hash.new(0)
     @game_team_stats.each do |games|
         games.hoa == "away"
      goals_scored_visitor[games.team_id] += games.goals.to_i
      end
      y = goals_scored_visitor.max_by {|team, values| values / x.count(team) }
      team_id_converter(y[0])
    end

    #Name of the team with the highest average score per game across all seasons when they are
  def highest_scoring_home_team
      x = @game_team_stats.map do |game|
         game.hoa == "away"
         game.team_id
       end
      goals_scored_visitor = Hash.new(0)
       @game_team_stats.each do |games|
           games.hoa == "away"
        goals_scored_visitor[games.team_id] += games.goals.to_i
        end
        y = goals_scored_visitor.max_by {|team, values| values / x.count(team) }
        team_id_converter(y[0])
      end
    #Name of the team with the highest average score per game across all seasons when they are home.


  def lowest_scoring_visitor
    #Name of the team with the lowest average score per game across all seasons when they are a visitor
  end

  def lowest_scoring_home_team
  #Name of the team with the lowest average score per game across all seasons when they are at home.
  end

  def winningest_team
    #Name of the team with the highest win percentage across all seasons.
  end

  def best_fans
    #Name of the team with biggest difference between home and away win percentages.
  end

  def worst_fans
    #List of names of all teams with better away records than home records.
  end
  # def team_name_getter(hash)
  #   team = teams.find do |team|
  #     team.team_id == hash(0)
  # end
  # "#{team.shortname} #{team.teamname}"
  # end
end
