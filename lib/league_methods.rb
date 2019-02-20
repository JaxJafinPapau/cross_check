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
  end

  def best_defense
    #Name of the team with the lowest average number of goals allowed per game across all seasons.
  end

  def worst_defense
    #Name of the team with the highest average number of goals allowed per game across all seasons.
  end

  def highest_scoring_visitor
    #Name of the team with the highest average score per game across all seasons when they are away.
  end

  def highest_scoring_home_team
    #Name of the team with the highest average score per game across all seasons when they are home.
  end

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
