class ChangeColumnTypeInRecords < ActiveRecord::Migration[7.2]
  def change
    change_column :records, :defecation, :text
    change_column :records, :poop_amount, :text
    change_column :records, :poop_shape, :text
  end
end
