class WorkoutExercise < ActiveRecord::Base
  belongs_to :workout_session
  has_many :workout_sets
end
