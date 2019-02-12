module Mather
  def adder(game_file, column_a, column_b)
    game_file.map do |data_set|
      added_values = data_set[column_a].to_i + data_set[column_b].to_i
    end
  end

  def differencer(game_file, column_a, column_b)
    diff = game_file.map do |data_set|
      data_set[column_a].to_i - data_set[column_b].to_i
    end
    diff.map do |data|
      data.abs
    end
  end

  end

  def percentager(stat_a, stat_b)
    (stat_a.to_f / stat_b) * 100.00
  end

  def averager(column_a, column_b)

  end

  def ratioer(column_a, column_b)

  end
