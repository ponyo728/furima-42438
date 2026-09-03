FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '横浜市' }
    street_address { '1-1-1' }
    building_name { 'テストビル' }
    telephone_number { '09012345678' }
    token { 'test_tok_xxxxxx' }
  end
end
