require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '全ての項目の入力が存在すれば登録できること' do
      it 'nickname、email、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが必要である' do
        @user.nickname = 'aaa'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上,半角英数字混合での入力が必要である' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は名字と名前が必要で全角（漢字・ひらがな・カタカナ）での入力が必要である' do
        @user.first_name = '櫨'
        @user.last_name = 'ユウじ'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナは全角（カタカナ）での入力が必要である' do
        @user.first_name_kana = 'ハゼ'
        @user.last_name_kana = 'ユウジ'
        expect(@user).to be_valid
      end
      it '生年月日が必要である' do
        @user.birthday = '1982-08-22'
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailに@がなければ登録できない' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = 'hhh000'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'ユーザー本名は、名字が空では登録できない' do
        @user.first_name = ''
        @user.last_name = 'ユウじ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザー本名は、名前が空では登録できない' do
        @user.first_name = '櫨'
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー本名のフリガナは、名字が空では登録できない' do
        @user.first_name_kana = ''
        @user.last_name_kana = 'ユウジ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'ユーザー本名のフリガナは、名前が空では登録できない' do
        @user.first_name_kana = 'ハゼ'
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'ユーザー本名のフリガナは、名字が全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = '櫨'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'ユーザー本名のフリガナは、名前が全角（カタカナ）でなければ登録できない' do
        @user.last_name_kana = 'ゆう滋'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
