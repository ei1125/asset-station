FactoryBot.define do
  factory :expense do
    item     {"hoge"}
    cf       {"200"}
    month
    year
    user
  end
end