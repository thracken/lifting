class WorkoutSession < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises

  def get_current_routine
    Routine.find_by(active_status: 1)
  end

  def get_last_workout_group

  end

  def build_workout_exercises(routine, group)
    return if routine.class != Routine || group.class != ExerciseGroup
    group.exercises.each do |exercise|
      self.workout_exercises.create(workout_session_id: self.id, exercise_id: exercise.id, sets_goal: exercise.sets_goal, reps_goal: exercise.reps_goal)
    end
  end
end
