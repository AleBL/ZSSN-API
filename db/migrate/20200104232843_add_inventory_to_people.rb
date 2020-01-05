class AddInventoryToPeople < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :inventory, null: false, foreign_key: true
  end
end
