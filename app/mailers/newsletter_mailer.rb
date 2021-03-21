class NewsletterMailer < ApplicationMailer
  def welcome(subscription_id)
    @subscription = Subscription.find(subscription_id)
    mail(to: @subscription.email, subject: 'Please confirm your subscription')
  end

  def newsletter(subscription_id, posts)
    @subscription = Subscription.find(subscription_id)
    @posts = posts
    mail(to: @subscription.email, subject: 'Last Week On Show HN!')
  end
end
