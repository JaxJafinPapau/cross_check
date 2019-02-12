module Mather
  def adder(game_file, column_a, column_b)
    statistics = []
    CSV.foreach(game_file) do |data_set|
      added_values = data_set[column_a].to_i + data_set[column_b].to_i
      statistics << added_values
    end
    statistics
  end

  def differencer(game_file, column_a, column_b)
    statistics = []
    CSV.foreach(game_file) do |data_set|
      subtracted_values = data_set[column_a].to_i - data_set[column_b].to_i
      statistics << subtracted_values
    end
    statistics.map do |stat|
      stat.abs
    end
  end

  def percentager(column_a, column_b)

  end

  def averager(column_a, column_b)

  end

  def ratioer(column_a, column_b)

  end
end
