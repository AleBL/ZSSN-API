class AddInfectedToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :infected, :boolean
  end
end
