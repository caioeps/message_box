DEFAULT_PASSWORD = '123123'

users = %W(caio renan rodrigo italo sara luis gustavo).map do |name|
  User.create do |user|
    user.email = "#{name}@email.com"
    user.password = DEFAULT_PASSWORD
    user.password_confirmation = DEFAULT_PASSWORD
    user.authentication_token = 'token'
  end
end

50.times do |i|
  Message.create do |message|
    message.subject  = FFaker::LoremFR.phrase.split('.').first
    message.body     = FFaker::LoremFR.paragraph
    message.sender   = users.sample
    message.receiver = users.sample
  end
end
