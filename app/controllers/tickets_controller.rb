class TicketsController < ApplicationController

  def index
    @task = Task.find(params[:task_id])
    @task_tickets = @task.tickets

    if( @task_tickets )
      render json: { response: @task_tickets, error: false, message: '' }
    else
      render json: { response: '', error: true, message: 'Not exists tickets' }
    end
  end

  def create
    render json: { response: 'hola6', error: false }
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
    render json: { response: 'hola8', error: false }
  end

  def destroy
    render json: { response: 'hola9', error: false }
  end
end
