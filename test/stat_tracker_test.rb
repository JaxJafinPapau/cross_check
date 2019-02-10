require './lib/stat_tracker'
require 'minitest/autorun'
require 'minitest/pride'

class StatTrackerTest < Minitest::Test
  def setup
    @stat_tracker = StatTracker.new
  end

  def test_stat_tracker_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  def test_stat_tracker_has_highest_total_score
    assert_equal 0, @stat_tracker.highest_total_score
  end
end
