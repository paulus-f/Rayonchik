class AddRegionToSuggestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :suggestions, :region, index: true
  end
end
