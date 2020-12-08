FactoryBot.define do
  factory :item do
    name          {"名前"}
    introduction    {"説明"}
    price           {2000}
    item_condition_id  {1}
    postage_id         {1}
    prefecture_id      {1}
    prepare_id         {1}
    category_id        {1}
    association :user
  end
end
