class UsersController < ApplicationController
  respond_to :json
  before_filter :set_headers

  def index
    @users = User.where(:state => 1).order(:name)
    if( @users.count > 0 )
      render :json => @users, :callback => params[:callback]
      # render json: { response: @users, error: false, message: nil }
    else
      render json: { response: nil, error: true, message: 'Not exists users' }
    end
  end

  def create
    render json: { response: 'ok', error: false }
  end

  def show
    @user = User.where(:id => params[:id], :state => 1)
    if( @user )
      render json: { response: @user, error: false, message: nil }
    else
      render json: { response: nil, error: true, message: 'Not exists user' }
    end
  end

  def update
    render json: { response: 'ok', error: false }
  end

  def destroy
    @user = User.where(:id => params[:id])
    @user.state(1)
    if( @user.count > 0 )
      render json: { response: true, error: false, message: 'Removed user successful' }
    else
      render json: { response: nil, error: true, message: 'Not exists user' }
    end
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
