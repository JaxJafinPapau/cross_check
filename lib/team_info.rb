require 'pry'
require './lib/stat_tracker'
class TeamInfo

  attr_reader :team_id,
              :franchiseid,
              :shortname,
              :teamname,
              :abbreviation,
              :link

def initialize(categories)
      @team_id = categories[:team_id]
      @franchiseid = categories[:franchiseid]
      @shortname = categories[:shortname]
      @teamname = categories[:teamname]
      @abbreviation = categories[:abbreviation]
      @link = categories[:link]
    end
  end
