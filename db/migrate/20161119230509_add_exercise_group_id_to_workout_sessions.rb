class AddExerciseGroupIdToWorkoutSessions < ActiveRecord::Migration
  def change
    add_column :workout_sessions, :exercise_group_id, :integer
    add_index :workout_sessions, :exercise_group_id
  end
end
