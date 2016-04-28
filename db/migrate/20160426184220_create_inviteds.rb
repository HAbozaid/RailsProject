class CreateInviteds < ActiveRecord::Migration
  def change
    create_table :inviteds do |t|
      t.references :order, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
