class WorkoutSession < ActiveRecord::Base
  
  has_many :workout_exercises
end
