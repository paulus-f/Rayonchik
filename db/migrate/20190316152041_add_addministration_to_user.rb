class AddAddministrationToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :administration, index: true
  end
end
