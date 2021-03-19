class AddConfirmTokenToSubscriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :confirm_token, :string
    add_index :subscriptions, :confirm_token, unique: true
  end
end
