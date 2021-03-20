require 'rails_helper'

RSpec.describe 'ConfirmSubscriptions', type: :request do
  let(:subscription) { create(:subscription, confirmed_at: nil)}

  describe 'successfull subscription confirmation' do
    before { get '/confirm/' + subscription.confirm_token }

    it 'get redirected' do
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to include 'subscription is confirmed'
    end
  end

  describe 'invalid confirmation link' do
    before { get '/confirm/' + 'fake_token' }

    it 'get redirected' do
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq nil
    end
  end

  describe 'already confirmed' do
    before do
      subscription.confirm!
      get '/confirm/' + subscription.confirm_token
    end

    it 'get redirected' do
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to include 'already confirmed'
    end
  end
end
