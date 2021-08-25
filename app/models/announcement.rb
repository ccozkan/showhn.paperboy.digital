class Announcement < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :announced_at
end
