class AddInfoToSuggestion < ActiveRecord::Migration[5.2]
  def change
    add_column :suggestions, :title, :string
    add_column :suggestions, :description, :text
    add_reference :suggestions, :user, index: true
  end
end
