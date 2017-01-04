class RemoveRepsActualFromWorkoutExercises < ActiveRecord::Migration
  def change
    remove_column :workout_exercises, :reps_actual
  end
end
