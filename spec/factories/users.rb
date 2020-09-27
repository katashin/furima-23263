FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.name }
    email                   { Faker::Internet.free_email }
    password                { Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    first_name              { 'カ片やま' }
    last_name               { 'カ片やま' }
    first_name_kana         { 'カタヤマ' }
    last_name_kana          { 'カタヤマ' }
    birth_date              { Date.new(2000, 11, 12) }
  end
end
