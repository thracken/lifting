require 'test_helper'

class WorkoutSessionTest < ActiveSupport::TestCase
  def setup
    @user = users(:jeff)
    @routine = routines(:phraks)
  end

  test "get a routine" do
    assert_equal @routine.name, "Phrak's Grey Skull LP"
  end
end
