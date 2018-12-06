class Message < ApplicationRecord
  belongs_to :receiver, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  scope :archived, -> { where.not(archived_at: nil) }
  scope :not_archived, -> { where(archived_at: nil) }
  scope :read, -> { where.not(read_at: nil) }

  enum status: { pending: 0, processed: 1 }, _suffix: true

  def archived?
    !!archived_at
  end

  def read!
    update_attribute(:read_at, Time.zone.now)
  end

  def read?
    !!read_at
  end

  def toggle_archive!
    update_attribute(:archived_at, archived? ? nil : Time.zone.now)
  end
end
