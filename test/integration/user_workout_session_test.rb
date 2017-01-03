require 'test_helper'

class UserWorkoutSessionTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:jeff)
  end

  test "create a new workout session" do
    log_in_as @user
    get new_workout_session_url
    assert_difference "WorkoutSession.count", 1 do
      post workout_sessions_url, workout_session: {date: Time.now, user_id: @user.id}
    end
  end
end
