class TicketsController < ApplicationController
  respond_to :json
  before_filter :set_headers

  def index
    @task = Task.find(params[:task_id])
    @task_tickets = @task.tickets

    if( @task_tickets )
      # render json: { response: @task_tickets, error: false, message: '' }
      render :json => @task_tickets.to_json, :callback => params[:callback], :content_type => 'application/json'
    else
      render json: { response: '', error: true, message: 'Not exists tickets' }
    end
  end

  def create
    render json: { response: 'ok', error: false }
  end

  def show
    @ticket = Ticket.where(:id => params[:id])
    if( @ticket.count > 0 )
      render json: { response: @ticket, error: false, message: nil }
    else
      render json: { response: nil, error: true, message: 'Not exists ticket' }
    end
  end

  def update
    render json: { response: 'ok', error: false }
  end

  def destroy
    render json: { response: 'ok', error: false }
  end
end
