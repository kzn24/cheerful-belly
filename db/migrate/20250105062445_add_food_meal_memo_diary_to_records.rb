class AddFoodMealMemoDiaryToRecords < ActiveRecord::Migration[7.2]
  def change
    add_column :records, :food, :string, null: false, default: "未入力"
    add_column :records, :meal_memo, :string, null: false, default: "未入力"
    add_column :records, :diary, :text, null: false, default: "未入力"
  end
end
