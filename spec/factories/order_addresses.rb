FactoryBot.define do
  factory :order_address do
    token            { 'tok_abcdefghijk00000000000000000' }
    item_id          { '1' }
    postal_code      { '000-0000' }
    shipping_area_id { '2' }
    ship_address     { '1-1-1' }
    ship_city        { 'テスト市' }
    building         { 'テストマンション' }
    tel_number       { '00000000000' }
  end
end
