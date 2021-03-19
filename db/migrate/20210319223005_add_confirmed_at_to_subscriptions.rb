class AddConfirmedAtToSubscriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :confirmed_at, :datetime
  end
end
