require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it ' 必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存される' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include{"Image can't be blank"}
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Item name can't be blank"}
      end
      it 'item_descriptionが空では出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Item description can't be blank"}
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Category can't be blank"}
      end
      it 'category_idが1では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Category must be other than 1"}
      end
      it 'item_condition_idが空では出品できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Item condition can't be blank"}
      end
      it 'item_condition_idが1では出品できない' do
        @item.item_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Item condition must be other than 1"}
      end
      it 'shipping_fee_idが空では出品できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Shipping fee can't be blank"}
      end
      it 'shipping_fee_idが1では出品できない' do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Shipping fee must be other than 1"}
      end
      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Prefecture can't be blank"}
      end
      it 'prefecture_idが1では出品できない' do
        @item.item_name = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Prefecture must be other than 1"}
      end
      it 'days_to_ship_idが空では出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Days to ship can't be blank"}
      end
      it 'days_to_ship_idが1では出品できない' do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Days to ship must be other than 1"}
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Price can't be blank"}
      end
      it 'priceが¥300未満では出品できない' do
        @item.item_name = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Price must be greater than or equal to 300"}
      end
it 'priceが¥10,000,000以上では出品できない' do
        @item.item_name = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Price must be less than or equal to 9999999"}
      end
      it 'priceが全角漢字では出品できない' do
        @item.item_name = '五百'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Price is not a number"}
      end
      it 'priceが全角ひらがなでは出品できない' do
        @item.item_name = 'ごひゃく'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Price is not a number"}
      end
      it 'priceが全角カタカナでは出品できない' do
        @item.item_name = 'ゴヒャク'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Price is not a number"}
      end
      it 'priceが半角英字では出品できない' do
        @item.item_name = 'fivehundred'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Price is not a number"}
      end
      it 'priceが全角数字では出品できない' do
        @item.item_name = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include{"Price is not a number"}
      end
    end
  end
end



