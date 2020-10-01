FactoryBot.define do
  factory :item do
    name                     {"商品名"}
    info                     {"商品説明"}
    category_id              {2}
    sales_status_id          {2}
    shapping_fee_status_id   {2}
    prefecture_id            {2}
    scheduled_delivery_id    {2}
    price                    {9999}
  end
end
