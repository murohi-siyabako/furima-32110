require 'rails_helper'

RSpec.describe UserItem, type: :model do
  before do
    @user_item = FactoryBot.build(:user_item)
  end
  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@user_item).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it 'post_codeが空だと購入できない' do
        @user_item.post_code = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンがないと購入できない' do
        @user_item.post_code = "1234567"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureが未選択だと購入できない' do
        @user_item.prefecture_id = 0
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空だと購入できない' do
        @user_item.city = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @user_item.house_number = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @user_item.phone_number = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが数字でないと購入できない' do
        @user_item.phone_number = "kana"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number Input only number")
      end
      it 'tokenが空では購入できない' do
        @user_item.token = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
