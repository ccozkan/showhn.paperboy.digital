FactoryBot.define do
  factory :hacker_news_post do
    url { "https://my-exciting-project.com" }
    title { "New Exciting Project" }
    posted_at { Date.today - 5.days }
    score { rand(1..500) }
    external_id { SecureRandom.hex(5) }
  end
end
