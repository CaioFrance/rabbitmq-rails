class CreateServiceOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.text :description
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
