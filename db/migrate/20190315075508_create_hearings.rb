class CreateHearings < ActiveRecord::Migration[5.2]
  def change
    create_table :hearings do |t|
      t.string :name
      t.references :region

      t.timestamps
    end
  end
end
