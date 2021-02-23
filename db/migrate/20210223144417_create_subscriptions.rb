class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.string :email
      t.string :unsub_token

      t.timestamps
    end
    add_index :subscriptions, :unsub_token, unique: true
  end
end
