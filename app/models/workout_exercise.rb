class WorkoutExercise < ActiveRecord::Base
  belongs_to :workout_session
end
