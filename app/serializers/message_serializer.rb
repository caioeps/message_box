class MessageSerializer < ActiveModel::Serializer
  attributes :id, :subject, :body, :created_at

  belongs_to :sender
  belongs_to :receiver
end
