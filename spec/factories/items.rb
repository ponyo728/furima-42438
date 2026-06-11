FactoryBot.define do
  factory :item do
    name         { Faker::Commerce.product_name }
    description  { Faker::Lorem.sentence }
    category_id  { 2 }
    condition_id { 3 }
    shipping_cost_id { 2 }
    prefecture_id    { 3 }
    shipping_time_id { 2 }
    price            { 20_000 }
    association :user

    after(:build) do |item|
      item.image.attach(
        io: Rails.root.join('public/images/test_image.png').open,
        filename: 'test_image.png'
      )
    end
  end
end
