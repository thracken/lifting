class RoutinesController < ApplicationController
  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    if @routine.save
      flash[:success] = "Routine added!"
      redirect_to routines_url
    else
      render 'new'
    end
  end

  def index
    @routines = Routine.all
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
    def routine_params
      params.require(:routine).permit(:name)
    end
end
