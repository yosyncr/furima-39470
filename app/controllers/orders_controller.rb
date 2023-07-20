class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item,only:[:index,:create]
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_delivery_address = OrderDeliveryAddress.new
    if @item.order.present? || current_user.id == @item.user_id
      return redirect_to root_path
    end
  end

  def create
    @order_delivery_address =OrderDeliveryAddress.new(order_delivery_address_params)
    if @order_delivery_address.valid?
      pay_item
      @order_delivery_address.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def order_delivery_address_params
    params.require(:order_delivery_address).permit(:postal_code,:region_id,:city,:address,:building_name,:phone_number).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item[:price],  # 商品の値段
        card: order_delivery_address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  def find_item
  @item = Item.find(params[:item_id])
  end
end
