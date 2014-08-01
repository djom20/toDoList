class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :description
      t.integer :state
      t.references :task, index: true

      t.timestamps
    end
  end
end
