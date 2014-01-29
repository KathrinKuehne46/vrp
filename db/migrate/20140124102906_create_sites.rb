class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :codename, :limit => 3

      t.timestamps
    end
  end
end
