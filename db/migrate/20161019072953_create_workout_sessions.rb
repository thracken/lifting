class CreateWorkoutSessions < ActiveRecord::Migration
  def change
    create_table :workout_sessions do |t|
      t.DateTime :date

      t.timestamps null: false
    end
  end
end
