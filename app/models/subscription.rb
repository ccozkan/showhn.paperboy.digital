class Subscription < ApplicationRecord
  has_secure_token :unsub_token
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  after_commit :send_welcome_email, on: :create

  def send_newsletter_email(posts)
    NewsletterMailer.newsletter(self, posts).deliver_later
  end

  def send_welcome_email
    NewsletterMailer.welcome(self).deliver_later
  end
end
