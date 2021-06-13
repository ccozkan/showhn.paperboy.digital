# == Schema Information
#
# Table name: subscriptions
#
#  id            :bigint           not null, primary key
#  email         :string
#  unsub_token   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  confirm_token :string
#  confirmed_at  :datetime
#
class Subscription < ApplicationRecord
  has_secure_token :unsub_token
  has_secure_token :confirm_token

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  after_commit :send_welcome_email, on: :create

  def self.confirmed_subscriptions
    where.not(confirmed_at: nil)
  end

  def send_newsletter_email(posts)
    NewsletterMailer.newsletter(self.id, posts).deliver_later
  end

  def send_welcome_email
    NewsletterMailer.welcome(self.id).deliver_later
  end

  def confirm!
    update!(confirmed_at: Time.current.utc)
  end

  def confirmed?
    !!(confirmed_at)
  end
end
