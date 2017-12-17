class MessageForm < Reform::Form
  property :subject
  property :receiver_email, virtual: true
  property :body

  validates :subject,        presence: true
  validates :receiver_email, presence: true
  validates :body,           presence: true

  validate :receiver_email_must_exist

  private

  def receiver_email_must_exist
    unless User.exists?(email: receiver_email)
      errors.add(:receiver_email, 'Email não encontrado!')
    end
  end
end
