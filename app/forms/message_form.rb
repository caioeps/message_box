class MessageForm < Reform::Form
  property :subject
  property :receiver_email, virtual: true
  property :receiver_id, readable: false
  property :sender_id, readable: false
  property :body

  validates :subject,        presence: true
  validates :receiver_email, presence: true
  validates :receiver_id,    presence: true
  validates :sender_id,      presence: true
  validates :body,           presence: true

  validate :receiver_email_must_exist

  def validate(params)
    @receiver = User.find_by(email: params[:receiver_email])
    self.receiver_id = @receiver&.id
    super
  end

  private

  def receiver_email_must_exist
    if @receiver.nil?
      errors.add(:receiver_email, 'não encontrado!')
    end
  end
end
