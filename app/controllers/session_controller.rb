class SessionController < ApplicationController
  respond_to :json
  before_filter :set_headers
  
  def create
    render :json => 'ok'.to_json, :callback => params[:callback], :content_type => 'application/json'
  end

  def destroy
  	render :json => 'ok'.to_json, :callback => params[:callback], :content_type => 'application/json'
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
