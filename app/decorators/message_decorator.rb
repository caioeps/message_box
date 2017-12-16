class MessageDecorator < Draper::Decorator
  delegate_all

  def truncated_body
    h.truncate(object.body, length: 80)
  end

  class << self
    def inbox_table_headings
      [
        Message.human_attribute_name(:sender),
        Message.human_attribute_name(:subject),
        Message.human_attribute_name(:body),
        Message.human_attribute_name(:created_at),
      ]
    end
  end
end
