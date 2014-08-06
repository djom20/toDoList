class TasksController < ApplicationController
  respond_to :json
  
  def index
    @user = User.find(params[:user_id])
    @user_tasks = @user.tasks

    headers['Access-Control-Allow-Origin'] = '*' 
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['content-type'] = 'application/json'

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
