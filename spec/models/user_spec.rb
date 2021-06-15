require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '登録できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '登録できないとき'do
      it 'nameが空だと保存できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが全角日本語でないと保存できないこと' do
        @user.name = 'yapo'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Name is invalid. Input full-width characters.")
      end

      it 'name_readingが空だと保存できないこと' do
        @user.name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name reading can't be blank")
      end

      it 'name_readingが全角カタカナでないと保存できないこと' do
        @user.name_reading = 'ﾔﾎﾟ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name reading is invalid. Input full-width katakana characters.")
      end

      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'nicknameが半角でないと保存できないこと' do
        @user.nickname = 'やぽ'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Nickname is invalid. Input half-width characters.")
      end
    end
  end
end
