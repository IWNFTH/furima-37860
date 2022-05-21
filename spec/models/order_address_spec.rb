require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '購入できるとき' do
      it '全て正しく入力されていれば登録できる' do
        expect(@order_address).to be_valid
      end

      it '建物名は空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できないとき' do
      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が空では登録できない' do
        @order_address.shipping_area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '市区町村が空では登録できない' do
        @order_address.ship_city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Ship city can't be blank")
      end

      it '番地が空では登録できない' do
        @order_address.ship_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Ship address can't be blank")
      end

      it '電話番号が空では登録できない' do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number is invalid')
      end

      it '郵便番号は全角では登録できない' do
        @order_address.postal_code = '０００−００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '郵便番号はハイフンなしでは登録できない' do
        @order_address.postal_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '電話番号は全角では登録できない' do
        @order_address.tel_number = '０００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number is invalid')
      end

      it '電話番号は9桁以下では登録できない' do
        @order_address.tel_number = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number is invalid')
      end

      it '電話番号は12桁以上では登録できない' do
        @order_address.tel_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number is invalid')
      end

      it 'userが紐付いていないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
