class CreateReportPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :report_people do |t|
      t.references :report_to, null: false, foreign_key: { to_table: 'people' }
      t.references :report_from, null: false, foreign_key: { to_table: 'people' }

      t.timestamps
    end
  end
end
