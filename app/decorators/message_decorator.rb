class MessageDecorator < Draper::Decorator
  delegate_all

  def truncated_body
    h.truncate(object.body, length: 80)
  end
end
