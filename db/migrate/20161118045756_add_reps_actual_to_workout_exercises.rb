class AddRepsActualToWorkoutExercises < ActiveRecord::Migration
  def change
    add_column :workout_exercises, :reps_actual, :integer
  end
end
