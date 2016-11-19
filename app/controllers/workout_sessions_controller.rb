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
      redirect_to @workout_session
    else
      render 'new'
    end
  end

  def show
    @workout_session = WorkoutSession.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def workout_sessions_params
      params.require(:workout_session).permit(:date, :user_id)
    end
end
