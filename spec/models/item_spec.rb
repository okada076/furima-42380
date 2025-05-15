require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できるとき' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it '商品画像がないと保存できない' do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと保存できない' do
       @item.name = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空だと保存できない' do
       @item.description = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが「---」だと保存できない（id:1は無効）' do
       @item.category_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態が「---」だと保存できない（id:1は無効）' do
       @item.condition_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '配送料の負担が「---」だと保存できない（id:1は無効）' do
       @item.shipping_fee_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end
      it '発送元の地域が「---」だと保存できない（id:1は無効）' do
       @item.prefecture_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '配送までの日数が「---」だと保存できない（id:1は無効）' do
       @item.scheduled_delivery_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end
      it '価格が空だと保存できない' do
       @item.price = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満では保存できない' do
       @item.price = 299
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が10,000,000円以上では保存できない' do
       @item.price = 10_000_000
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格が半角数字以外（例：全角数字や英字）では保存できない' do
       @item.price = '１０００' # 全角
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'ユーザーが紐付いていないと保存できない' do
       @item.user = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("User must exist") 
      end
    end
  end
end