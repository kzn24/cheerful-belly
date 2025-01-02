class CreateRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.date :record_date, null: false
      t.integer :condition_rating, null: false, default: 0
      t.integer :belly_rating, null: false, default: 0
      t.integer :meal_rating, null: false, default: 0
      t.integer :poop_rating, null: false, default: 0

      t.timestamps
    end
  end
end
