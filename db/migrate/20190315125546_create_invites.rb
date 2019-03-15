class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.references :user
      t.string :token
      t.timestamps
    end
  end
end
