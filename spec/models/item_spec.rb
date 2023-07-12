require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品できない場合' do
  it 'カテゴリーがないと出品できない'do
  @item.category_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Category can't be blank", "Category can't be blank")
  end
  it '状態を記入してないと出品できない'do
  @item.condition_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition can't be blank")
  end
  it '商品名がないと出品できない'do
  @item.item_name = ''
  @item.valid?
  expect(@item.errors.full_messages).to include()
  end
  it '商品の詳細がないと出品できない'do
  @item.description = ''
  @item.valid?
  expect(@item.errors.full_messages).to include()
  end
  it '送料の負担がないと出品できない'do
  @item.fee_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Fee can't be blank", "Fee can't be blank")
  end
  it '配送までの日数がないと出品できない'do
  @item.delivery_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Delivery can't be blank", "Delivery can't be blank")
  end
  it '地域の指定がないと出品出来ない'do
  @item.region_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Region can't be blank", "Region can't be blank")
  end
  it '値段がないと出品できない'do
  @item.price = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
  end
  it 'category_idが1以外でなければ出品できない' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it 'condition_idが1以外でなければ出品できない' do
    @item.condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end
  it 'fee_idが1以外でなければ出品できない' do
    @item.fee_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Fee can't be blank")
  end
  it 'region_idが1以外でなければ出品できない' do
    @item.region_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Region can't be blank")
  end
  it 'delivery_idが1以外でなければ出品できない' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it '画像がないと出品出来ない'do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it '値段が300円以下では出品できない' do
    @item.price= 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
  end
  it '値段が9999999円より高いと出品出来ない' do
    @item.price= 111111111111111111
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
  end
 end
 describe '出品できる場合' do
  it 'すべての情報が入力できている場合'do
  expect(@item).to be_valid
 end
end
end