class AddWorkoutExerciseIdToWorkoutSets < ActiveRecord::Migration
  def change
    add_column :workout_sets, :workout_exercise_id, :integer
    add_index :workout_sets, :workout_exercise_id
  end
end
