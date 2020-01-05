class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :local

      t.timestamps
    end
  end
end
