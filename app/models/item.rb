class Item < ApplicationRecord
  belongs_to :user
  has_one :order
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
  validates :price, presence: true
  validates :price,numericality: { message: 'の全角数字は使えません' }
  validates :region_id, numericality: { other_than: 1 , message: "は空です"}
  validates :category_id, numericality: { other_than: 1 , message: "は空です"}
  validates :delivery_id, numericality: { other_than: 1 , message: "は空です"}
  validates :condition_id, numericality: { other_than: 1 , message: "は空です"}
  validates :fee_id, numericality: { other_than: 1 , message: "は空です"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,only_integer: true, message: "は300円から9,999,999円の間で入力してください" }
  has_one_attached :image


end
