class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :shapping_fee_status

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id, numericality: { other_than: 1 }
    validates :sales_status_id, numericality: { other_than: 1 }
    validates :shapping_fee_status_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :scheduled_delivery_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  belongs_to :user
  has_one_attached :image
end
