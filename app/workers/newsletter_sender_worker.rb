class NewsletterSenderWorker
  include Sidekiq::Worker

  def perform(*args)
    posts = HackerNewsPost.score_ordered_posts_of_last_week
    Subscription.all.each do |sub|
      NewsletterMailer.newsletter_email(sub, posts).deliver_later
    end
  end
end
