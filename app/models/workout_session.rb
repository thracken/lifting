class WorkoutSession < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises
end
