class FixErrorInRegion < ActiveRecord::Migration[5.2]
  def change
    remove_column :regions, :adminstration_id
    change_table :regions do |t|
      t.references :administration
    end
  end
end
