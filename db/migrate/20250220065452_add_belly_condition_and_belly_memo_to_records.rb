class AddBellyConditionAndBellyMemoToRecords < ActiveRecord::Migration[7.2]
  def change
    add_column :records, :belly_condition, :text, null: false, default: "未入力"
    add_column :records, :belly_memo, :string
  end
end
