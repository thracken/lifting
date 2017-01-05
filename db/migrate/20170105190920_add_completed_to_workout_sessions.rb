class AddCompletedToWorkoutSessions < ActiveRecord::Migration
  def change
    add_column :workout_sessions, :completed, :boolean
  end
end
