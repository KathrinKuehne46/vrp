class CreateDemandSites < ActiveRecord::Migration
  def change
    create_table :demand_sites do |t|
      t.integer :site_id
      t.float :demand_quantity

      t.timestamps
    end
  end
end
