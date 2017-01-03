require 'test_helper'

class WorkoutSessionTest < ActiveSupport::TestCase
  def setup
    @user = users(:jeff)
    @routine = routines(:phraks)
    @session = @routine.workout_sessions.build
  end

  test "get a routine" do
    assert_equal @routine.name, "Phrak's Grey Skull LP"
  end

  test "" do
    assert @session.valid?
  end
end
