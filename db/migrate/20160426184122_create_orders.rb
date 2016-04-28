class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :for
      t.string :from
      t.string :menu_image
      t.string :status
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
