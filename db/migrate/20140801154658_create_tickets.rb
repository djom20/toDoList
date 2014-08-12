class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :task, index: true
      t.string :description
      t.integer :completed, :default => 1
      t.integer :state, :default => 1

      t.timestamps
    end

    Ticket.create!(task_id: 1, description: 'Take out the trash')
    Ticket.create!(task_id: 1, description: 'I will write another task')
    Ticket.create!(task_id: 2, description: 'Go out and buy a dictionary')
    Ticket.create!(task_id: 2, description: 'Remember to do the food at 6pm')
  end
end
