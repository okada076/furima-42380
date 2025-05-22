class ChangeOrderIdToReferenceInAddresses < ActiveRecord::Migration[7.1]
  def change
    remove_column :addresses, :order_id, :integer
    add_reference :addresses, :order, foreign_key: true
  end
end
