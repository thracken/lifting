class RoutinesController < ApplicationController
  before_action :logged_in_user, only: [:create, :index, :new]

  def new
    @routine = Routine.new
  end

  def create
    @routine = current_user.routines.build(routine_params)
    if @routine.save
      flash[:success] = "Routine added!"
      redirect_to routines_url
    else
      render "new"
    end
  end

  def index
    @routines = current_user.routines
  end

  def show
    @routine = Routine.find(params[:id])
  end

  def edit
    @routine = Routine.find(params[:id])
  end

  def update
    @routine = Routine.find(params[:id])
    if @routine.update_attributes(routine_params)
      flash.now[:success] = "Routine updated!"
    else
      render "edit"
    end
  end

  def destroy
  end

  private
    def routine_params
      params.require(:routine).permit(:name)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "You need to log in to do that"
        redirect_to login_url
      end
    end
end
