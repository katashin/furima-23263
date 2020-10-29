require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe '購入履歴と購入先登録' do
    context '登録がうまくいくとき' do
      it '全ての情報が正しく入力されていれば登録' do
        expect(@item_order).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it 'カード情報が正しく入力されていない（tokenが正しく取得できていない）' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空白だと登録できない' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフン（-）がないと登録できない' do
        @item_order.postal_code = '1112222'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'cityが空白だと登録できない' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空白だと登録できない' do
        @item_order.addresses = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空白だと登録できない' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以内だと保存できないこと' do
        @item_order.phone_number = '0001111'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberにハイフン(-)が含まれていると保存できない' do
        @item_order.phone_number = '-'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @item_order.phone_number = '090111122222'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'prefecture_idが１だと登録できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Prefecture must be other than 1')
      end
    end
  end
end
