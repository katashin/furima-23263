require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー情報登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空白では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空白では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが一意性（重複していない）であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@が含まれていないと登録できないこと' do
      @user.email = 'testgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空白では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは６文字以上でないと登録できないこと' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは半角英数字混合でないと登録できないこと' do
      @user.password = 'shinsuke'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwrodは確認を含め２回入力しないと登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '本人情報登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'ユーザー本名(first_name)が、名字が空白だと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'ユーザー本名(last_name)が、名前が空白だと登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'ユーザー本名(first_name)は全角（漢字・ひらがな・カタカナ）で入力しないと登録されない' do
      @user.first_name = 'shiｽｹ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'ユーザー本名(last_name)は全角（漢字・ひらがな・カタカナ）で入力しないと登録されない' do
      @user.last_name = 'shiｽｹ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'ユーザー本名のフリガナが、名字と名前がそれぞれ入力されていないと登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'ユーザー本名のフリガナは全角（カタカナ）で入力されていないと登録できない' do
      @user.first_name_kana = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
      @user.last_name_kana = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it '生年月日が空白だと登録できない' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
