class CreateUsersVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :users_votes do |t|
      t.references :vote, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
