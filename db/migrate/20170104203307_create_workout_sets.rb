class CreateWorkoutSets < ActiveRecord::Migration
  def change
    create_table :workout_sets do |t|
      t.integer :reps
      t.float :weight

      t.timestamps null: false
    end
  end
end
