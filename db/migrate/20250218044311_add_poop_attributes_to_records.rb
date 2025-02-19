class AddPoopAttributesToRecords < ActiveRecord::Migration[7.2]
  def change
    add_column :records, :defecation, :string, null: false, default: "未入力"
    add_column :records, :poop_amount, :string, null: false, default: "未入力"
    add_column :records, :poop_shape, :string, null: false, default: "未入力"
    add_column :records, :poop_memo, :string
  end
end
