class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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
end
