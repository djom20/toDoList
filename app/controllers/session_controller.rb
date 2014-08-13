class SessionController < ApplicationController
  
  def create
    render :json => @task_tickets.to_json, :callback => params[:callback], :content_type => 'application/json'
  end

  def destroy
  	render :json => @task_tickets.to_json, :callback => params[:callback], :content_type => 'application/json'
  end
end
