class AnnouncementMailer < ApplicationMailer
  default from: "PaperboyDigital <no-reply@showhn.paperboy.digital>"
  default reply_to: "PaperboyDigital <hey@paperboy.digital>"
  layout "mailer"

  def announcement(subscription_id, announcement)
    @subscription = Subscription.find(subscription_id)
    @announcement = announcement
    mail(to: @subscription.email, subject: @announcement.title)
  end
end
