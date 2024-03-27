require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it '必要な情報を適切に入力して「会員登録」ボタンを押すと登録ができる' do
       expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include{"Nickname can't be blank"}
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include{"Email can't be blank"}
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include{"Password can't be blank"}
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include{"Last_name can't be blank"}
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include{"First_name can't be blank"}
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include{"Last_name_kana can't be blank"}
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include{"First_name_kana can't be blank"}
      end
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include{"Date_of_birth can't be blank"}
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが全角文字を含む場合は登録できない' do
        @user.password = '00000ａ'
        @user.password_confirmation = '00000ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')    
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'asdfgh'
        @user.password_confirmation = 'asdfgh'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')    
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')    
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが半角英数字では登録できない' do
        @user.last_name = 'tesuto'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角漢字、かな、カナでご入力ください')
      end
      it 'first_nameが半角英数字では登録できない' do
        @user.first_name = 'tesuto'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角漢字、かな、カナでご入力ください')
      end
      it 'last_name_kanaが全角漢字では登録できない' do
        @user.last_name_kana = '手須戸'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カナでご入力ください')
      end
      it 'last_name_kanaが全角ひらがなでは登録できない' do
        @user.last_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カナでご入力ください')
      end
      it 'last_name_kanaが半角英数字では登録できない' do
        @user.last_name_kana = 'tesuto'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カナでご入力ください')
      end
      it 'first_name_kanaが全角漢字では登録できない' do
        @user.first_name_kana = '手須戸'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カナでご入力ください')
      end
      it 'first_name_kanaが全角ひらがなでは登録できない' do
        @user.first_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カナでご入力ください')
      end
      it 'first_name_kanaが半角英数字では登録できない' do
        @user.first_name_kana = 'tesuto'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カナでご入力ください')
      end
    end
  end
end


