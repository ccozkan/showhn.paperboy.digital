class ConfirmSubscriptionsController < ApplicationController
  before_action :find_subscription, only: [:show]

  def show
    if @subscription.nil?
      redirect_to root_path
      return
    elsif @subscription.confirmed?
      redirect_to root_path, notice: 'Your subscription is already confirmed'
      return
    end

    @subscription.confirm!
    redirect_to root_path, notice: 'Your subscription is confirmed, see you soon!'
  end

  private

  def find_subscription
    @subscription = Subscription.find_by(confirm_token: params[:token])
  end
end
