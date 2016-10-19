class CreateExerciseGroups < ActiveRecord::Migration
  def change
    create_table :exercise_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
