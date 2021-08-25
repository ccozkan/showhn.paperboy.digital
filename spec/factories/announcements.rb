FactoryBot.define do
  factory :announcement do
    title { "Hi there" }
    body { "Some important things" }
    announced_at { Date.today }
  end
end
