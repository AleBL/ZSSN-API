class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.integer :water
      t.integer :food
      t.integer :medication
      t.integer :ammunition

      t.timestamps
    end
  end
end
