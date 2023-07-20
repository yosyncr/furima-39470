class OrderDeliveryAddress
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions

  attr_accessor :postal_code, :region_id, :city, :address, :building_name, :phone_number,  :item_id, :user_id, :token

  with_options presence: true do
    validates :region_id,numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :address
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は「3桁ハイフン4桁」の形式で入力してください" }
    validates :phone_number,  format: {with: /\A\d{10,11}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    DeliveryAddress.create(postal_code: postal_code,region_id: region_id,city: city,address: address, building_name: building_name,phone_number: phone_number,order_id: order.id)
  end
end