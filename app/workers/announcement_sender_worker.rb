class AnnouncementSenderWorker
  include Sidekiq::Worker

  def perform(*args)
    posts = HackerNewsPost.top20_posts_of_last_week
    subscriptions = Subscription.confirmed_subscriptions

    subscriptions.each do |sub|
      sub.send_newsletter_email(posts)
    end
  end
end
