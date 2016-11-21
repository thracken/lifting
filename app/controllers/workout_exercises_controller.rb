class WorkoutExercisesController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
    def workout_exercises_paranms
      params.require(:workout_exercise).permit()
    end
end
