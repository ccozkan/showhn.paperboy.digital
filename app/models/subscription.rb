class Subscription < ApplicationRecord
  has_secure_token :unsub_token
  validates_presence_of :email
  validates_presence_of :unsub_token
end
