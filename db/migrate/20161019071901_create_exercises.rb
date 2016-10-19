class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.float :weight
      t.float :increment
      t.integer :reps_goal
      t.integer :sets_goal
      t.integer :time_between_sets

      t.timestamps null: false
    end
  end
end
