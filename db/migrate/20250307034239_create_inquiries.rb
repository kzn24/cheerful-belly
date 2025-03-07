class CreateInquiries < ActiveRecord::Migration[7.2]
  def change
    create_table :inquiries do |t|
      t.string :customer_name, null: false
      t.string :customer_email, null: false
      t.text :inquiry_message, null: false

      t.timestamps
    end
  end
end
