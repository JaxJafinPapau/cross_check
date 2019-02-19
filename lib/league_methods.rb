require "pry"
require './lib/game_methods'

module LeagueMethods

  def total_number_of_teams
    team_info_rows.count
  end

  def average_goals_scored

  end

  def best_offense
    # Name of the team with the highest average number of goals scored per game across all seasons.
  end

    # Name of the team with the highest average number of goals scored per game across all seasons.

  def worst_offense
    #Name of the team with the lowest average number of goals scored per game across all seasons.
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

end
