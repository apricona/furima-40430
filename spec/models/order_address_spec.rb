require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  sleep(2)
  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '必要な情報を適切に入力して「購入」ボタンを押すと、商品の購入ができる' do
        expect(@order_address).to be_valid
      end

      it '建物名がなくても商品の購入ができる' do
        @building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it '郵便番号がないと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include{"Postal code can't be blank
        "}
      end

      it '都道府県がないと購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include{"Prefecture must be other than 1"}
      end

      it '市区町村がないと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include{"City can't be blank"}
      end

      it '番地がないと購入できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include{"Street addres can't be blank"}
      end

      it ' 電話番号がないと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include{"Phone number can't be blank"}
      end

      it 'prefecture_idが1では購入できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include{"Prefecture must be other than 1"}
      end

      it '郵便番号は-を含まないと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include{"Postal code is invalid. Include hyphen(-)"}
      end

      it '電話番号が9桁以下だと購入できない' do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include{"PPhone number は10桁または11桁の半角数値で入力してください"}
      end

      it '電話番号が12桁以上だと購入できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include{"Phone number は10桁または11桁の半角数値で入力してください"}
      end

      it 'userが紐づいていない場合出品できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include{"User must exist"}
      end

      it 'itemが紐づいていない場合出品できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include{"Item must exist"}
      end

      it 'tokenがないと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include{"Token can't be blank"}
      end

    end
  end
end

