class Order < ApplicationRecord
  belongs_to :user
  has_one :addresse
  belongs_to :item
end
