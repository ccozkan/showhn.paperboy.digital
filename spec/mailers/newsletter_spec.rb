require "rails_helper"


RSpec.describe NewsletterMailer, type: :mailer do
  let(:subscription) { create(:subscription) }

  describe '#welcome' do
    context 'enqueued job is added' do
      it do
        expect { subscription.send_welcome_email }.to have_enqueued_job(ActionMailer::MailDeliveryJob).with('NewsletterMailer', 'welcome', 'deliver_now', { args: [subscription] } )
      end
    end

    context 'email is sent' do
      subject(:mailer) { described_class.welcome(subscription) }

      it do
        expect(mailer.from).to eq ['no-reply@showhn.paperboy.digital']
        expect(mailer.subject).to include 'Welcome to'
        expect(mailer.body.raw_source).to include 'Please confirm '
      end
    end
  end

  describe '#newsletter' do
    let(:post) { create(:hacker_news_post) }
    let(:posts) { [post] }

    context 'enqueued job is added' do
      it do
        expect { subscription.send_newsletter_email([post]) }.to have_enqueued_job(ActionMailer::MailDeliveryJob).with('NewsletterMailer', 'newsletter', 'deliver_now', { args: [subscription, [post]] })
      end
    end

    context 'email is sent' do
      subject(:mailer) { described_class.newsletter(subscription, posts) }

      it do
        expect(mailer.from).to eq ['no-reply@showhn.paperboy.digital']
        expect(mailer.subject).to include 'Last Week'
        expect(mailer.body.raw_source).to include post.url
      end
    end
  end
end
