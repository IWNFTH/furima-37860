class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :ship_city, :ship_address, :building, :tel_number, :price, :user_id, :token,
                :item_id

  with_options presence: true do
    validates :ship_city, :ship_address, :user_id, :token, :item_id
  end
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :tel_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, ship_city: ship_city,
                   ship_address: ship_address, building: building, order_id: order.id)
  end
end
