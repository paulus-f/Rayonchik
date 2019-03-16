class AddApproveToSuggestion < ActiveRecord::Migration[5.2]
  def change
    add_column :suggestions, :approve, :boolean
  end
end
