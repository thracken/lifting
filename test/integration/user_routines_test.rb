require 'test_helper'

class UserRoutinesTest < ActionDispatch::IntegrationTest
  test "require a logged in user to create a routine" do
    get new_routine_url
    assert_redirected_to login_url
  end
end
