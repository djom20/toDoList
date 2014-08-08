class TasksController < ApplicationController
  respond_to :json
  before_filter :set_headers
  
  def index
    @user = User.find(params[:user_id])
    @user_tasks = @user.tasks

    # headers['Access-Control-Allow-Origin'] = '*'
    #  headers['Access-Control-Allow-Credentials'] = 'true'
    # headers['Access-Control-Request-Method'] = '*'
    # headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    # headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    # headers['content-type'] = 'application/json'

    if( @user_tasks )
      render :json => @user_tasks.to_json, :callback => params[:callback], :content_type => 'application/json'
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

  def set_headers
    puts 'ApplicationController.set_headers'
    if request.headers["HTTP_ORIGIN"]
      headers['Access-Control-Allow-Origin'] = request.headers["HTTP_ORIGIN"]
      headers['Access-Control-Expose-Headers'] = 'ETag'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,Auth-User-Token'
      headers['Access-Control-Max-Age'] = '86400'
      headers['Access-Control-Allow-Credentials'] = 'true'
    end
  end
end
