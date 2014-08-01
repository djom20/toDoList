class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, index: true
      t.string :name
      t.string :description
      t.integer :state, :default => 1

      t.timestamps
    end

    Task.create!(user_id: 1, name: 'How to make my first task', description: 'Here will go the description of my task')
    Task.create!(user_id: 1, name: 'List of homeworks', description: 'Here will go the other description of this task')
  end
end
