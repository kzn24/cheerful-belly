class CreateRecordDrugs < ActiveRecord::Migration[7.2]
  def change
    create_table :record_drugs do |t|
      t.references :record, null: false, foreign_key: true
      t.references :drug, null: false, foreign_key: true

      t.timestamps
    end
  end
end
