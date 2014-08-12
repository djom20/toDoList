class TicketsController < ApplicationController
  respond_to :json
  before_filter :set_headers

  def index
    @task = Task.find(params[:task_id])
    @task_tickets = @task.tickets

    if( @task_tickets )
      render :json => @task_tickets.to_json, :callback => params[:callback], :content_type => 'application/json'
    else
      render :json => 'Error'.to_json, :callback => params[:callback], :content_type => 'application/json'
    end
  end

  def create
    render :json => 'Ok'.to_json, :callback => params[:callback], :content_type => 'application/json'
  end

  def show
    @ticket = Ticket.where(:id => params[:id])
    if( @ticket.count > 0 )
      render :json => @ticket.to_json, :callback => params[:callback], :content_type => 'application/json'
    else
      render :json => 'Error'.to_json, :callback => params[:callback], :content_type => 'application/json'
    end
  end

  def update
    render :json => 'Ok'.to_json, :callback => params[:callback], :content_type => 'application/json'
  end

  def destroy
    render :json => 'Ok'.to_json, :callback => params[:callback], :content_type => 'application/json'
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
