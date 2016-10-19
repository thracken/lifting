class CreateWorkoutExercises < ActiveRecord::Migration
  def change
    create_table :workout_exercises do |t|
      t.integer :session_id
      t.integer :exercise_id
      t.integer :sets
      t.integer :reps

      t.timestamps null: false
    end
    add_index :workout_exercises, :session_id
    add_index :workout_exercises, :exercise_id
  end
end
