class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
    validates :token
  end
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }, if: lambda {
    postal_code.present?
  }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }, if: -> { phone_number.present? }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # Order（購入情報）を保存
    order = Order.create(user_id: user_id, item_id: item_id)

    # Address（住所）を保存
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
