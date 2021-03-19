class NewsletterSenderWorker
  include Sidekiq::Worker

  def perform(*args)
    posts = HackerNewsPost.score_ordered_posts_of_last_week
    Subscription.all.each do |subscription|
      subscription.send_newsletter_email(posts)
    end
  end
end
