class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :task, index: true
      t.string :description
      t.integer :completed, :default => 0
      t.integer :state, :default => 1

      t.timestamps
    end

    Ticket.create!(task_id: 1, description: 'Take out the trash', completed: 1)
    Ticket.create!(task_id: 1, description: 'I will write another task', completed: 1)
    Ticket.create!(task_id: 2, description: 'Go out and buy a dictionary')
    Ticket.create!(task_id: 2, description: 'Remember to do the food at 6pm', completed: 1)
    Ticket.create!(task_id: 2, description: 'Remember to do the dinners at 4pm', completed: 1)
    Ticket.create!(task_id: 2, description: 'Go to School')
    Ticket.create!(task_id: 2, description: 'Study math')
  end
end
