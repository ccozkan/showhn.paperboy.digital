class NewsletterSenderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    last_weeks_posts = HackerNewsPost.posts_since_last_week
    Subscription.all.each do |sub|
      NewsletterMailer.newsletter_email(sub, last_weeks_posts).deliver_now
    end
  end
end
