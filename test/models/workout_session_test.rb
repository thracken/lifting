require 'test_helper'

class WorkoutSessionTest < ActiveSupport::TestCase
  def setup
    @user = users(:jeff)
    @session = WorkoutSession.new(date: Time.now, user_id: @user.id)
    @routine = routines(:phraks)
  end

  test "get active routine" do
    assert_equal @session.get_active_routine, @routine
  end
end
