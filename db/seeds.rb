user_1 = User.create do |user|
  user.email = 'email@email.com'
  user.password = '123123'
  user.password_confirmation = '123123'
end

user_2 = User.create do |user|
  user.email = 'anotheremail@email.com'
  user.password = '123123'
  user.password_confirmation = '123123'
end

30.times do |i|
  Message.create do |message|
    message.subject = "Subject #{i}"
    message.body = "body" * rand(10) * i
    message.sender = user_1
    message.receiver = user_2
  end
end

20.times do |i|
  Message.create do |message|
    message.subject = "Subject #{i}"
    message.body = "body" * rand(10) * i
    message.sender = user_2
    message.receiver = user_2
  end
end
