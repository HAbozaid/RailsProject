class AddFriendsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :friends, :string
  end
end
