require 'rails_helper'

RSpec.describe User, type: :model do
  describe '会員情報入力' do
    it "nucknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("")
    end
    it "emailが空では登録できない" do
    end
  end
end
