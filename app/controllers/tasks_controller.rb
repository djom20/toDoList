class TasksController < ApplicationController
  
  def index
    @user = User.select(:id, :name, :lastname, :email, :password).where(:id => params[:user_id])
    @user_tasks = @user.tasks
    # @tasks = @user
    if( @user_tasks.count(:id) > 0 )
      render json: { response: @user_tasks, error: false, message: '' }
    else
      render json: { response: nil, error: true, message: 'Not exists tasks' }
    end
  end

  def create
    render json: { response: 'ok', error: false }
  end

  def show
    @task = User.where(:id => params[:id])
    if( @task.count > 0 )
      render json: { response: @task, error: false, message: nil }
    else
      render json: { response: nil, error: true, message: 'Not exists task' }
    end
  end

  def update
    render json: { response: 'ok', error: false }
  end

  def destroy
    render json: { response: 'ok', error: false }
  end
end
