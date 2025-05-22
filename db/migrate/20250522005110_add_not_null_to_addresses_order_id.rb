class AddNotNullToAddressesOrderId < ActiveRecord::Migration[7.1]
  def change
    change_column_null :addresses, :order_id, false
  end
end
