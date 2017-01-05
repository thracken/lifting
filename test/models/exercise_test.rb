require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  def setup
    @exercise = Exercise.create(name: "Bench Press", weight: 45, weight_increment: 2.5, reps_goal: 5, sets_goal: 3, time_between_sets: 90)
  end

  test "weight increments properly" do
    assert_equal @exercise.increment_weight, 47.5
  end
end
