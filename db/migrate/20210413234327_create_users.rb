class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.integer :role, default: 0
      t.integer :therapist_id, null: true

      t.timestamps
    end
  end
end
