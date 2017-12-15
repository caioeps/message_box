class Message < ApplicationRecord
  belongs_to :receiver, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  def archive!
    update_attribute(:archived_at, Time.zone.now)
  end
end
