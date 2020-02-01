FactoryBot.define do
  factory :month do
    month {Faker::Number.within(range: 1..12)}
    # month       {3}
    year
    user
  end
end