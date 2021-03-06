class ExerciseGroupsController < ApplicationController
  def new
    @routine = Routine.find(params[:routine_id])
    @exercise_group = ExerciseGroup.new
  end

  def create
    @routine = Routine.find(params[:routine_id])
    @exercise_group = @routine.exercise_groups.build(exercise_group_params)
    if @exercise_group.save
      flash[:success] = "Group Added!"
      redirect_to routines_url
    else
      render "new"
    end
  end

  def edit
    @routine = Routine.find(params[:routine_id])
    @exercise_group = ExerciseGroup.find(params[:id])
  end

  def update
    @routine = Routine.find(params[:routine_id])
    @exercise_group = ExerciseGroup.find(params[:id])
    if @exercise_group.update_attributes(exercise_group_params)
      flash[:success] = "Group Updated!"
      redirect_to routines_url
    else
      render "edit"
    end
  end

  def destroy
    ExerciseGroup.find(params[:id]).destroy
    flash[:success] = "Group deleted!"
    redirect_to routines_url
  end

  private
    def exercise_group_params
      params.require(:routine_exercise_group).permit(:name)
    end
end
