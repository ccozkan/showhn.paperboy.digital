class NewsletterMailer < ApplicationMailer
  def welcome(subscription)
    @subscription = subscription
    mail(to: @subscription.email, subject: 'Please confirm your subscription')
  end

  def newsletter(subscription, posts)
    @subscription = subscription
    @posts = posts
    mail(to: @subscription.email, subject: 'Last Week On Show HN!')
  end
end
