require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '新規商品投稿登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '商品名が空白だと登録出来ない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が空白だと登録出来ない' do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank", 'User must exist')
    end
    it 'カテゴリーの情報が1（---）だと登録出来ない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態についての情報が1（---）だと登録出来ない' do
      @item.sales_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Sales status must be other than 1')
    end
    it '配送料の負担についての情報が1（---）だと登録出来ない' do
      @item.shapping_fee_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shapping fee status must be other than 1')
    end
    it '発送元の地域についての情報が1（---）だと登録出来ない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '発送までの日数についての情報が1（---）だと登録出来ない' do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
    end
    it '価格についての情報がないと登録出来ない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の下限が、300円以下だとと登録出来ない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の上限が9,999,999円以上だと登録できない' do
      @item.price = 19_999_999
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '販売価格は半角英数字のみでないと登録出来ない' do
      @item.price = '９９９９'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
