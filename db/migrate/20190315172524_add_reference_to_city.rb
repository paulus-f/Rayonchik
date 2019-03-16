class AddReferenceToCity < ActiveRecord::Migration[5.2]
  def change
    change_table :cities do |t|
      t.references :province
    end
  end
end
