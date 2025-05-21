class AddDetailsToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :postal_code, :string
    add_column :addresses, :prefecture_id, :integer
    add_column :addresses, :city, :string
    add_column :addresses, :address, :string
    add_column :addresses, :building_name, :string
    add_column :addresses, :phone_number, :string
    add_column :addresses, :order_id, :integer
  end
end
