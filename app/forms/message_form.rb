class MessageForm < Reform::Form
  property :subject
  property :receiver_email, virtual: true
  property :receiver_id, readable: false
  property :body

  validates :subject,        presence: true
  validates :receiver_email, presence: true
  validates :body,           presence: true

  validate :receiver_email_must_exist

  def validate(params)
    @user = User.find_by(email: params[:receiver_email])
    self.receiver_id = @user&.id
    super
  end

  private

  def receiver_email_must_exist
    if @user.nil?
      errors.add(:receiver_email, 'Email não encontrado!')
    end
  end
end
