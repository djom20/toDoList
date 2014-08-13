class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :email, null: false, default: ""
      t.string :password, null: false, default: ""
      t.integer :state, :default => 1
      # t.timestamps
    end

    # User.create!(name: 'Jonathan', lastname: 'Olier', email: 'djom202@gmail.com', password: '123456', encrypted_password: '')
    # User.create!(name: 'Hector', lastname: 'Villazon')
    # User.create!(name: 'Karen', lastname: 'Sampayo')
    # User.create!(name: 'Paola', lastname: 'Macias')
  end
end
