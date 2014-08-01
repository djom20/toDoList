class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :state
      t.references :user, index: true

      t.timestamps
    end
  end
end
