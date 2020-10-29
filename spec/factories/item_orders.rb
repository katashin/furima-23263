FactoryBot.define do
  factory :item_order do
    token           { 'tok_00000a7b210b9ff795ef07000000' }
    postal_code     { '111-1111' }
    city            { '国分寺市' }
    addresses       { '国分寺町1-1-1' }
    phone_number    { '09011112222' }
    prefecture_id   { '2' }
  end
end
