FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Quote.famous_last_words }
    price { Faker::Commerce.price }
  end
end
