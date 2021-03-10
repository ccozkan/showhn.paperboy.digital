class NewsletterMailer < ApplicationMailer
  def welcome_email(subscription)
    @subscription = subscription
    mail(to: @subscription.email, subject: 'Welcome to My Awesome Site')
  end

  def newsletter_email(subscription, posts)
    @subscription = subscription
    @posts = posts
    mail(to: @subscription.email, subject: 'Last Week On Show HN!')
  end
end
