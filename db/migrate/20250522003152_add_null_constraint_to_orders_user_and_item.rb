class AddNullConstraintToOrdersUserAndItem < ActiveRecord::Migration[7.1]
  def change
    change_column_null :orders, :user_id, false
    change_column_null :orders, :item_id, false
  end
end
