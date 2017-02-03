class WorkoutSession < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises

  def get_active_routine
    self.user.routines.find_by(active_status: 1)
  end

  def get_next_workout_group
    all_groups = self.get_active_routine.exercise_groups
    previous_workout_session = WorkoutSession.where(:user => self.user).last

    if previous_workout_session.class == WorkoutSession
      last_workout_group_id = previous_workout_session.exercise_group_id
    else
      last_workout_group_id = nil
    end

    return all_groups.first if last_workout_group_id.nil?

    all_groups.each_with_index do |group, index|
      next_in_line = all_groups[index+1]
      if group.id = last_workout_group_id
        return all_groups[0] if next_in_line.nil?
        return next_in_line
      end
    end
  end

  def build_workout_exercises(routine, exercise_group)
    return if routine.class != Routine || exercise_group.class != ExerciseGroup
    self.exercise_group_id = exercise_group.id
    self.save

    exercise_group.exercises.each do |exercise|
      new_workout_exercise = self.workout_exercises.create(workout_session_id: self.id, exercise_id: exercise.id, sets_goal: exercise.sets_goal, reps_goal: exercise.reps_goal)
      exercise.sets_goal.times do
        new_workout_exercise.workout_sets.create(reps: exercise.reps_goal, weight: Exercise.find(exercise.id).weight, workout_exercise_id: new_workout_exercise.id)
      end
    end
  end
end
