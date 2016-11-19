class WorkoutSession < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises

  def get_current_routine
    Routine.find_by(active_status: 1)
  end

  def get_last_workout_group

  end

  def build_workout_exercises(routine, group)
    return if routine.class != Routine
    group.exercises.each do |exercise|
      
    end
  end
end
