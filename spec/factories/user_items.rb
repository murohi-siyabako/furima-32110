FactoryBot.define do
  factory :user_item do
    post_code       {"123-4567"}
    prefecture_id   {1}
    city            {"愛知県"}
    house_number    {"1-1"}
    building_name    {"UH"}
    phone_number    {"09012345678"}
    token           {"tok_abcdefghijk00000000000000000"}
  end
end
