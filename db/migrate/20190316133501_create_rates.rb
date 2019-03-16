# frozen_string_literal: true

class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references %i[user active_suggestion]
      t.timestamps
    end
  end
end
