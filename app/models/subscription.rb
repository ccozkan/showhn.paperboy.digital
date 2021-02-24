class Subscription < ApplicationRecord
  has_secure_token :unsub_token
  validates_presence_of :email
end
