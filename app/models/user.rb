class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :received_messages, class_name: 'Message', foreign_key: :receiver_id
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
end
