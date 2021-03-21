class UnsubscriptionsController < ApplicationController
  before_action :find_subscription, only: [:show]

  def show
    if @subscription.nil?
      redirect_to root_path
      return
    end
    @subscription.destroy
    render plain: 'Successfully unsubscribed, take care!'
  end

  private

  def find_subscription
    @subscription = Subscription.find_by(unsub_token: params[:token])
  end
end
