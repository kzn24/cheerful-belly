class CreateDrugs < ActiveRecord::Migration[7.2]
  def change
    create_table :drugs do |t|
      t.string :drug_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
