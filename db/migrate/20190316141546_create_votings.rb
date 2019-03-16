class CreateVotings < ActiveRecord::Migration[5.2]
  def change
    create_table :votings do |t|
      t.references :vote, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
