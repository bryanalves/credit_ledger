class CreateCustomers < ActiveRecord::Migration[4.2]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :postal_code
      t.string :customer_id
      t.string :view_token, null: false

      t.timestamps
    end

    add_index :customers, :first_name
    add_index :customers, :last_name
    add_index :customers, :customer_id, unique: true
  end
end
