class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :item_name,          presence: true
  validates :description,        presence: true
  validates :category_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_area_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :image,              presence: true
  validates :price,              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "can't be blank" }
end
