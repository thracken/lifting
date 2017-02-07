class WorkoutSession < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises

  before_create :set_exercise_group
  after_create :build_workout_exercises

  def get_next_workout_group
    all_groups = self.get_active_routine.exercise_groups
    previous_workout_session = WorkoutSession.where(:user => self.user).order(date: :desc).limit(1).first

    if previous_workout_session.nil?
      return all_groups.first
    else
      last_workout_group_id = previous_workout_session.exercise_group_id
    end

    all_groups.each_with_index do |group, index|
      next_in_line = all_groups[index+1]
      if group.id == last_workout_group_id
        return next_in_line
      else
        return all_groups[0]
      end
    end
  end

  private
    def set_exercise_group
      self.exercise_group_id = self.get_next_workout_group.id
    end

    def build_workout_exercises
      routine = self.get_active_routine
      exercise_group = ExerciseGroup.find(self.exercise_group_id)

      exercise_group.exercises.each do |exercise|
        new_workout_exercise = self.workout_exercises.create(workout_session_id: self.id, exercise_id: exercise.id, sets_goal: exercise.sets_goal, reps_goal: exercise.reps_goal)
        exercise.sets_goal.times do
          new_workout_exercise.workout_sets.create(reps: exercise.reps_goal, weight: Exercise.find(exercise.id).weight, workout_exercise_id: new_workout_exercise.id)
        end
      end
    end
end
