class AddRoutineReferenceToExerciseGroups < ActiveRecord::Migration
  def change
    add_reference :exercise_groups, :routine, index: true, foreign_key: true
  end
end
