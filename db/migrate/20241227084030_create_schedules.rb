class CreateSchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :schedules do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :user, null: false, foreign_key: true
      t.references :drug, foreign_key: true
      t.references :supplement, foreign_key: true  # サプリメントとの関連

      t.timestamps
    end
  end
end
