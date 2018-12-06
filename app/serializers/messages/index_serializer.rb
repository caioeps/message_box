module Messages
  class IndexSerializer < ActiveModel::Serializer
    attributes :id, :subject, :created_at, :read, :archived, :status

    belongs_to :sender
    belongs_to :receiver

    def archived
      object.archived?
    end

    def read
      object.read?
    end

    private

    def decorated_message
      @decorated_message ||= object.decorated? ? object : object.decorate
    end
  end
end
