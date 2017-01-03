class WorkoutSession < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises

  def get_active_routine
    self.user.routines.find_by(active_status: 1)
  end

  def get_next_workout_group
    all_groups = self.get_active_routine.exercise_groups
    previous_workout_session = WorkoutSession.find_by(:user => self.user)

    if previous_workout_session.class == Array
      last_workout_group = previous_workout_session.last.exercise_group_id
    elsif previous_workout_session.class == WorkoutSession
      last_workout_group = previous_workout_session.exercise_group_id
    else
      last_workout_group = nil
    end

    return all_groups.first if last_workout_group.nil?

    all_groups.each_with_index do |group, index|
      next_in_line = all_groups[index+1]
      if group.id = last_workout_group
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
