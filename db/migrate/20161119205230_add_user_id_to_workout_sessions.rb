class AddUserIdToWorkoutSessions < ActiveRecord::Migration
  def change
    add_column :workout_sessions, :user_id, :integer
    add_index :workout_sessions, :user_id
  end
end
