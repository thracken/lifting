class ExercisesController < ApplicationController
  def new
    @exercise_group = ExerciseGroup.find(params[:exercise_group_id])
    @exercise = Exercise.new
  end

  def create
    @exercise_group = ExerciseGroup.find(params[:exercise_group_id])
    @exercise = @exercise_group.exercises.build(exercise_params)
    if @exercise.save
      flash[:success] = "Exercise Added!"
      redirect_to routines_url
    else
      render "new"
    end
  end

  def edit
    @exercise_group = ExerciseGroup.find(params[:exercise_group_id])
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise_group = ExerciseGroup.find(params[:routine_id])
    @exercise = Exercise.find(params[:id])
    if @exercise.update_attributes(exercise_params)
      flash[:success] = "Exercise Updated!"
      redirect_to routines_url
    else
      render "edit"
    end
  end

  def destroy
    Exercise.find(params[:id]).destroy
    flash[:success] = "Exercise deleted!"
    redirect_to routines_url
  end

  private
    def exercise_params
      params.require(:exercise).permit(:name)
    end
end
