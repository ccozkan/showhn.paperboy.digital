class AnnouncementSenderWorker
  include Sidekiq::Worker

  def perform(*args)
    subscriptions = Subscription.confirmed_subscriptions
    announcement = args.first

    subscriptions.each do |sub|
      sub.send_announcement_email(announcement)
    end
  end
end
