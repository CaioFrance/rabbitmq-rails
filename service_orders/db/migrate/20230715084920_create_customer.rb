class CreateCustomer < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :email
      t.string :identification_code

      t.timestamps
      t.index %w[email], unique: true
    end
  end
end
