class AddReasonToSuggestion < ActiveRecord::Migration[5.2]
  def change
    add_column :suggestions, :reason, :string
  end
end
