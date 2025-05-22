class ChangeUserAndItemToReferencesInOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :user_id, :integer
    remove_column :orders, :item_id, :integer

    add_reference :orders, :user, foreign_key: true
    add_reference :orders, :item, foreign_key: true
  end
end
