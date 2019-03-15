class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.string :title
      t.text :description
      t.string :image
      t.references :user, :region
      t.string :type
      t.timestamps
    end
  end
end
