class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
   belongs_to :condition
    belongs_to :fee
    belongs_to :region
    belongs_to :delivery
  validates :item_name, presence: true
  validates :category_id, presence: true
  validates :description,presence: true
  validates :image, presence: true
  validates :condition_id, presence: true
  validates :fee_id, presence: true
  validates :region_id, presence: true
  validates :delivery_id, presence: true
  validates :price, presence: true,format:{with: /\A[0-9]+\z/}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "must be between ¥300 and ¥9,999,999" }
  has_one_attached :image
 

end
