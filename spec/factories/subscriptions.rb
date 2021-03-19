FactoryBot.define do
  factory :subscription do
    email { "foo@bar.com" }
    after(:build) {|subscription| subscription.class.skip_callback(:commit, :after, :send_welcome_email, raise: false)}
  end
end
