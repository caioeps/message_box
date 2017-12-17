module Messages
  class IndexSerializer < ActiveModel::Serializer
    attributes :id, :subject, :created_at, :read

    belongs_to :sender
    belongs_to :receiver

    def read
      object.read?
    end

    private

    def decorated_message
      @decorated_message ||= object.decorated? ? object : object.decorate
    end
  end
end
