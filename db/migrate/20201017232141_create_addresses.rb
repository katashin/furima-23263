class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string    :postal_code,   null: false
      t.integer   :prefecture_id, null: false
      t.string    :city,          null: false
      t.string    :addresses,     null: false
      t.string    :building
      t.string    :phone_number,  null: false
      t.integer   :item_id,  foreing_key: true
      t.integer   :order_id, foreing_key: true
      t.timestamps
    end
  end
end