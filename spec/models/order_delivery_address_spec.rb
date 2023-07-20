require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_delivery_address = FactoryBot.build(:order_delivery_address,item_id: item.id,user_id: user.id)
  end
  context '内容に問題ある場合' do
    it "tokenが空あれば保存ができないこと" do
      @order_delivery_address.token = nil
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号が空であれば保存できないこと"do
      @order_delivery_address.postal_code = nil
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it "郵便番号は3桁ハイフン4桁出ないと保存できないこと"do
    @order_delivery_address.postal_code = 1234457
    @order_delivery_address.valid?
    expect(@order_delivery_address.errors.full_messages).to include("Postal code は「3桁ハイフン4桁」の形式で入力してください")
    end
    it "都道府県が空であれば保存できないこと"do
    @order_delivery_address.region_id = 1
    @order_delivery_address.valid?
    expect(@order_delivery_address.errors.full_messages).to include("Region can't be blank")
    end
    it "市区町村が空であれば保存できないこと"do
    @order_delivery_address.city = nil
    @order_delivery_address.valid?
    expect(@order_delivery_address.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空であれば保存できないこと"do
    @order_delivery_address.address = nil
    @order_delivery_address.valid?
    expect(@order_delivery_address.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号が空であれば保存できないこと"do
    @order_delivery_address.phone_number = nil
    @order_delivery_address.valid?
    expect(@order_delivery_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号は、9桁以下では保存できないこと"do
    @order_delivery_address.phone_number = 111111111
    @order_delivery_address.valid?
    expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号は、12桁以上では保存できないこと"do
    @order_delivery_address.phone_number = 1111111111111111
    @order_delivery_address.valid?
    expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号に半角数字以外が含まれている場合は購入できない"do
    @order_delivery_address.phone_number = "1111111111あ"
    @order_delivery_address.valid?
    expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'userが紐付いていないと保存できないこと' do
      @order_delivery_address.user_id = ''
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと保存できないこと' do
      @order_delivery_address.item_id = ''
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include("Item can't be blank")
    end
  end
  context '内容に問題ない場合' do
   it "建物名が空でも登録できる"do
   @order_delivery_address.building_name = nil
   expect(@order_delivery_address).to be_valid
   end
   it 'すべての情報があれば登録できる' do
    expect(@order_delivery_address).to be_valid
   end
  end
end