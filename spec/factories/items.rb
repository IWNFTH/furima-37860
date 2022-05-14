FactoryBot.define do
  factory :item do
    user_id            { '1' }
    item_name          { '商品名' }
    description        { '商品説明' }
    category_id        { '2' }
    status_id          { '2' }
    shipping_charge_id { '2' }
    shipping_area_id   { '2' }
    days_to_ship_id    { '2' }
    price              { '10000' }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end