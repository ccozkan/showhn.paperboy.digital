require "rails_helper"

RSpec.describe AnnouncementMailer, type: :mailer do
  let(:subscription) { create(:subscription) }

  describe "#newsletter" do
    let(:announcement) { Announcement.new(subject: 'hello everybody', body: 'here is a cool update').formatted }

    context "enqueued job is added" do
      it do
        expect { subscription.send_announcement_email(announcement) }.to have_enqueued_job(ActionMailer::MailDeliveryJob).with("AnnouncementMailer", "announcement", "deliver_now", { args: [subscription.id, announcement] })
      end
    end

    context "email is sent" do
      subject(:mailer) { described_class.announcement(subscription.id, announcement) }

      it do
        expect(mailer.from).to eq ["no-reply@showhn.paperboy.digital"]
        expect(mailer.subject).to include "hello everybody"
        expect(mailer.body.raw_source).to include "here is a cool update"
      end
    end
  end
end
