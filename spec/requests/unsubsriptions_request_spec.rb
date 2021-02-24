require 'rails_helper'

RSpec.describe 'Unsubscriptions', type: :request do
  describe 'unsubscribing user' do
    before do
      @subscription = Subscription.new(email: 'foo@bar.com')
      @subscription.save!
    end

    it 'get redirects' do
      get '/unsubscribe/' + @subscription.unsub_token
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
      expect(Subscription.find_by(email: 'foo@bar.com')).to eq nil
    end
  end
end
