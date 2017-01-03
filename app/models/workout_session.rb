class WorkoutSession < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises

  def get_active_routine
    current_user.routines.find_by(active_status: 1)
  end

  def get_next_workout_group
    all_groups = self.get_active_routine.exercise_groups
    last_group = ExerciseGroup.find(self.user.workout_sessions.last.exercise_group_id)

    all_groups.each_with_index do |element, index|
      next_in_line = all_groups[index+1]
      if element.id = last_group.id
        if next_in_line.nil?
          return all_groups.first
        else
          return next_in_line
        end
      end
    end
  end

  def build_workout_exercises(routine, group)
    return if routine.class != Routine || group.class != ExerciseGroup
    self.exercise_group_id = group.id

    group.exercises.each do |exercise|
      self.workout_exercises.create(workout_session_id: self.id, exercise_id: exercise.id, sets_goal: exercise.sets_goal, reps_goal: exercise.reps_goal)
    end
  end
end
