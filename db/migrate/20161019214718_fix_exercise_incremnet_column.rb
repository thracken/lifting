class FixExerciseIncremnetColumn < ActiveRecord::Migration
  def change
    rename_column :exercises, :increment, :weight_increment
  end
end
