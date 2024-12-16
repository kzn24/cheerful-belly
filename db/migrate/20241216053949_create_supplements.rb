class CreateSupplements < ActiveRecord::Migration[7.2]
  def change
    create_table :supplements do |t|
      t.string :supplement_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
