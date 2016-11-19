class WorkoutSessionsController < ApplicationController
  def index
    @workout_sessions = WorkoutSession.all
  end

  def new
    @workout_session = WorkoutSession.new
  end

  def create
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def workout_sessions_params
    end
end
