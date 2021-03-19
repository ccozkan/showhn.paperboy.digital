FactoryBot.define do
  factory :subscription do
    email { "foo@bar.com" }
    confirmed_at { Time.current.utc }
  end
end
