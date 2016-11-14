class AddExercisesExerciseGroups < ActiveRecord::Migration
  def change
    create_join_table :exercises, :exercise_groups do |t|
      t.index :exercise_id
      t.index :exercise_group_id
    end
  end
end
