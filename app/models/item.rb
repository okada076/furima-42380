class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  # has_one :order

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

    validates :name, presence: true
    validates :description, presence: true
    validates :image, presence: true
    validates :category_id, presence: true
    validates :condition_id, presence: true
    validates :shipping_fee_id, presence: true
    validates :prefecture_id, presence: true
    validates :scheduled_delivery_id, presence: true
    validates :price, presence: true

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }

end
