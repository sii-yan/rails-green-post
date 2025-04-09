FactoryBot.define do
  factory :post do
    title { "テストタイトル" }
    content { "本文です" }
    association :user
  end
end
