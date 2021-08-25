class AnnouncementSenderWorker
  include Sidekiq::Worker

  def perform
    announcements = Announcement.where(announced_at: Date.today)
    subscriptions = Subscription.confirmed_subscriptions

    announcements.each do |an|
      subscriptions.each do |sub|
        sub.send_announcement_email(an)
      end
    end
  end
end
