class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.integer :state, :default => 1
      # t.timestamps
    end

    # User.create!(name: 'Jonathan', lastname: 'Olier')
    # User.create!(name: 'Hector', lastname: 'Villazon')
    # User.create!(name: 'Karen', lastname: 'Sampayo')
    # User.create!(name: 'Paola', lastname: 'Macias')
  end
end
