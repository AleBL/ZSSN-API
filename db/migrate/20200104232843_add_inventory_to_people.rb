class AddInventoryToPeople < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :inventory, foreign_key: true
  end
end
