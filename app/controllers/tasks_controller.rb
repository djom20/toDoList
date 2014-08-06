class TasksController < ApplicationController
  respond_to :json
  
  def index
    @user = User.find(params[:user_id])
    @user_tasks = @user.tasks

    if( @user_tasks )
      render :json => @user_tasks.to_json, :callback => params[:callback]
    else
      render json: { response: nil, error: true, message: 'Not exists tasks' }
    end
  end

  def create
    render json: { response: 'ok', error: false, message: 'Not exists tasks' }
  end

  def show
    @task = User.where(:id => params[:id])
    if( @task.count > 0 )
      render json: { response: @task, error: false, message: 'Not exists tasks' }
    else
      render json: { response: nil, error: true, message: 'Not exists task' }
    end
  end

  def update
    render json: { response: 'ok', error: false, message: 'Not exists tasks' }
  end

  def destroy
    render json: { response: 'ok', error: false, message: 'Not exists tasks' }
  end
end
