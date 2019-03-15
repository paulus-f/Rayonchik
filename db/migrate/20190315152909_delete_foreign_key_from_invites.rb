class DeleteForeignKeyFromInvites < ActiveRecord::Migration[5.2]
  def up
    remove_reference :invites, :user, index: true
  end

  def down
    add_reference :invites, :user, index: true
  end
end
