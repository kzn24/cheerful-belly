class CreateRecordSupplements < ActiveRecord::Migration[7.2]
  def change
    create_table :record_supplements do |t|
      t.references :record, null: false, foreign_key: true
      t.references :supplement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
