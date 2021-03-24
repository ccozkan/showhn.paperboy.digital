require 'rails_helper'

RSpec.describe 'Subscriptions', type: :request do
  describe 'POST' do
    context 'when success' do
      before { post '/subscriptions', params: { email: 'foo@bar.com' } }

      it 'gets redirected' do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when failure' do
      before { post '/subscriptions', params: { email: 'invalid_email_address' } }

      it do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to include 'Email is invalid'
      end
    end
  end
end
