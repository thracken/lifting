require 'test_helper'

class WorkoutSessionTest < ActiveSupport::TestCase
  def setup
    @user = users(:jeff)
    @session = WorkoutSession.new(date: Time.now, user_id: @user.id)
    @routine = routines(:phraks)
    @first_group = exercise_groups(:day_a)
    @second_group = exercise_groups(:day_b)
  end

  test "get active routine" do
    assert_equal @session.get_active_routine, @routine
  end

  test "get next workout group" do
    assert_equal @session.get_next_workout_group, @second_group #second group because of the way fixtures get loaded into the test db
  end

  test "build workout exercises" do
    assert_difference "WorkoutExercise.count", 3 do
      @session.build_workout_exercises(@session.get_active_routine, @session.get_next_workout_group)
    end
  end
end
