class CreateTranslinks < ActiveRecord::Migration
  def change
    create_table :translinks do |t|
      t.integer :supply_site_id
      t.integer :demand_site_id
      t.float :unit_cost
      t.float :transport_quantity

      t.timestamps
    end
  end
end
