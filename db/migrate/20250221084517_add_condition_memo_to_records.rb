class AddConditionMemoToRecords < ActiveRecord::Migration[7.2]
  def change
    add_column :records, :condition_memo, :string
  end
end
