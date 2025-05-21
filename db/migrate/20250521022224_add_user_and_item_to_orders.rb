class AddUserAndItemToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :user_id, :integer
    add_column :orders, :item_id, :integer
  end
end
