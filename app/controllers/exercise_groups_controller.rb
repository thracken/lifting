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
      render routines_url
    else
      render "new"
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def exercise_group_params
    end
end
