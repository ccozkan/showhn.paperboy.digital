class NewsletterMailer < ApplicationMailer
  def welcome(subscription)
    @subscription = subscription
    mail(to: @subscription.email, subject: 'Welcome to My Awesome Site')
  end

  def newsletter(subscription, posts)
    @subscription = subscription
    @posts = posts
    mail(to: @subscription.email, subject: 'Last Week On Show HN!')
  end
end
