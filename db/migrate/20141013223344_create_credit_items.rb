class CreateCreditItems < ActiveRecord::Migration[4.2]
  def change
    create_table :credit_items do |t|
      t.belongs_to :user
      t.belongs_to :customer
      t.references :category, null: false
      t.decimal :value, precision: 8, scale: 2, null: false
      t.text :note

      t.timestamps
    end
  end
end
