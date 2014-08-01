class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :password
      t.integer :state, :default => 1
      t.timestamps
    end

    User.create!(name: 'Jonathan', lastname: 'Olier', email: 'jolier@spes.co', password: 'spes2103')
    User.create!(name: 'Hector', lastname: 'Villazon', email: 'hector@spes.co', password: 'spes2103')
    User.create!(name: 'Karen', lastname: 'Sampayo', email: 'karen@spes.co', password: 'spes2103')
    User.create!(name: 'Paola', lastname: 'Macias', email: 'paola@spes.co', password: 'spes2103')
  end
end
