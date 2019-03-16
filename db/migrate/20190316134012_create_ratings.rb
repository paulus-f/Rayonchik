

class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :rate
      t.integer :amount
      t.timestamps
    end
    add_reference :suggestions, :rate, index: true
  end
end
