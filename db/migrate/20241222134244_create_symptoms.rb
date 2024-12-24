class CreateSymptoms < ActiveRecord::Migration[7.2]
  def change
    create_table :symptoms do |t|
      t.string :symptom_name, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
