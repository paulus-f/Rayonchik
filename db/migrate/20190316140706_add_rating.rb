class AddRating < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :amount
      t.references :user, :active_suggestion
      t.timestamps
    end
  end
end
