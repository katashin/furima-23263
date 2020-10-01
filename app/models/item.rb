class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :shapping_fee_status

  validates :prefecture, :sales_status, :scheduled_delivery, :shapping_fee_status, presence: true
  validates :prefecture_id, :sales_status_id, :scheduled_delivery_id, :shapping_fee_status_id, numericality: {other_than: 1} 
  # with_options presence: true do
  #   validates :price,
  #   validates :price,
  # end

  belongs_to :user
  # has_one :item_oder
  has_one_attached :image
end
