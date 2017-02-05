class WorkoutSessionsController < ApplicationController
  def index
    @workout_sessions = WorkoutSession.all
  end

  def new
    @workout_session = WorkoutSession.new
  end

  def create
    @workout_session = current_user.workout_sessions.build(workout_sessions_params)
    if @workout_session.save
      flash[:success] = "Session Started!"
      redirect_to edit_workout_session_url(@workout_session)
    else
      render 'new'
    end
  end

  def show
    @workout_session = WorkoutSession.find(params[:id])
  end

  def edit
    @workout_session = WorkoutSession.find(params[:id])
  end

  def update
    @workout_session = WorkoutSession.find(params[:id])
    if @workout_session.update_attributes(workout_sessions_params)
      flash[:success] = "Session updated!"
      redirect_to routines_url
    else
      render "edit"
    end
  end

  def destroy
    WorkoutSession.find(params[:id]).destroy
    flash[:success] = "Workout deleted!"
    redirect_to workout_sessions_url
  end

  private
    def workout_sessions_params
      params.require(:workout_session).permit(:date, :user_id)
    end
end
