class ChangeWorkoutSessionReferenceOnWorkoutExercises < ActiveRecord::Migration
  def change
    rename_column :workout_exercises, :session_id, :workout_session_id
  end
end
