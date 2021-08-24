class ConfirmSubscriptionsController < ApplicationController
  before_action :find_subscription, only: [:show]

  def show
    if @subscription.nil?
      redirect_to root_path
      return
    elsif @subscription.confirmed?
      render plain: "Your subscription is already confirmed"
      return
    end

    @subscription.confirm!
    render plain: "Your subscription is now confirmed, see you on wednesday!"
  end

  private

  def find_subscription
    @subscription = Subscription.find_by(confirm_token: params[:token])
  end
end
