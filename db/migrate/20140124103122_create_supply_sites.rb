class CreateSupplySites < ActiveRecord::Migration
  def change
    create_table :supply_sites do |t|
      t.integer :site_id
      t.float :supply_quantity

      t.timestamps
    end
  end
end
