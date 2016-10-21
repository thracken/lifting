require 'test_helper'

class UserRoutinesTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:jeff)
  end

  test "require a logged in user to see/create a routine" do
    get new_routine_url
    assert_redirected_to login_url
    get routines_url
    assert_redirected_to login_url
  end

  test "logged in users can see all routines, and create new routines" do
    log_in_as @user
    get new_routine_url
    assert_template "routines/new"
    get routines_url
    assert_template "routines/index"
  end
end
