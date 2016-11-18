class ChangeWorkoutExerciseColumnNames < ActiveRecord::Migration
  def change
    rename_column :workout_exercises, :sets, :sets_goal
    rename_column :workout_exercises, :reps, :reps_goal
  end
end
