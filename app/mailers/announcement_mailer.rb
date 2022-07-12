class AnnouncementMailer < ApplicationMailer
  def announcement(subscription_id, announcement)
    @subscription = Subscription.find(subscription_id)
    @announcement = JSON.parse(announcement)

    mail(to: @subscription.email, subject: @announcement["subject"])
  end
end
