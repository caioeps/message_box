class Messages::IndexSerializer < ActiveModel::Serializer
  attributes :id, :subject, :body, :created_at

  belongs_to :sender
  belongs_to :receiver

  def body
    decorated_message.truncated_body
  end

  private

  def decorated_message
    @decorated_message ||= object.decorated? ? object : object.decorate
  end
end
