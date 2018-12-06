class MessageSerializer < ActiveModel::Serializer
  attributes :id, :subject, :body, :created_at, :read, :status

  belongs_to :sender
  belongs_to :receiver

  def read
    object.read?
  end
end
