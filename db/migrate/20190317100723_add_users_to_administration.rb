class AddUsersToAdministration < ActiveRecord::Migration[5.2]
  def change
    add_reference :administrations, :user, index: true
  end
end
