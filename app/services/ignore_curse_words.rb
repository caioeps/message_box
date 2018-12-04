# frozen_string_literal:true

class IgnoreCurseWords
  BAD_WORDS = %w[
    caralho
    foda
    fuck
    porra
  ].freeze

  def initialize(message)
    @message = message
  end

  def call
    omit_bad_words_from_message_body
    message
  end

  private

  attr_reader :message

  def omit_bad_words_from_message_body
    message.body.gsub!(bad_words_regex) { |match| '*' * match.size }
  end

  def bad_words_regex
    Regexp.new(BAD_WORDS.join('|'), Regexp::IGNORECASE)
  end
end
