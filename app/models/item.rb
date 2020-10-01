class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :shapping_fee_status

  validates :image, :name, :info, :price, presence: true

  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  with_options presence: true do
    validates :category_id, numericality: { other_than: 1 }
    validates :sales_status_id, numericality: { other_than: 1 }
    validates :shapping_fee_status_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :scheduled_delivery_id, numericality: { other_than: 1 }
  end

  belongs_to :user
  # has_one :item_oder
  has_one_attached :image
end
