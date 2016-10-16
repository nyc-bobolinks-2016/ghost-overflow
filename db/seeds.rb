User.create(full_name: "Paul Duca", email: "thepaulyD@gmail.com", password: "password")
User.create(full_name: "Olivia Coffaro", email: "oco@gmail.com", password: "password")
User.create(full_name: "Derek Yang", email: "derek@pornhub.com", password: "password")


Question.create(title: "Good Tanning Salons in Lower Manhattan?", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet nisl eu nisl dignissim rutrum vel a ipsum. Vivamus tempus eros at tincidunt dapibus. Fusce auctor libero risus, aliquet dignissim risus malesuada blandit. Nunc pretium dolor in vulputate faucibus. Donec tincidunt tortor ex, at sodales massa tempor vitae. Aenean varius sed ex non pulvinar. In auctor mi suscipit felis dapibus, at luctus diam consectetur. Curabitur eu est dictum, vestibulum libero eu, maximus felis. Etiam accumsan tincidunt lacus, vel commodo lectus. Mauris tincidunt eget erat sit amet ornare. Vivamus quis gravida eros. Duis tincidunt vulputate sapien, non efficitur turpis.", user_id: 1)

Question.create(title: "Where can I buy more weights for my barbell?", content: "Sed consequat justo vel nulla lobortis auctor. Maecenas scelerisque ut diam sit amet auctor. Morbi eu eros blandit, iaculis lorem ut, rutrum sem. Duis nec libero dictum, sagittis augue in, consequat dui. Nulla lobortis maximus turpis quis scelerisque. Pellentesque ornare sodales enim, vel dapibus neque. Curabitur sit amet efficitur risus, eu consequat orci. Vestibulum convallis elit urna. Donec eget ex aliquam, malesuada nunc quis, venenatis augue. Nunc vehicula sapien sit amet lorem molestie, in aliquam tortor elementum. Nullam odio ipsum, malesuada ac posuere ut, ornare a metus.", user_id: 3)

Question.create(title: "Cat Cafe Suggestions?", content:"Sed porttitor, nibh in viverra euismod, justo metus tristique nulla, in pulvinar erat nulla vitae nibh. Cras ultrices nunc at venenatis cursus. Aliquam tempus suscipit justo sit amet tincidunt. Suspendisse sagittis purus eget risus elementum fringilla. Aliquam mollis quis leo vel vestibulum. Proin eu mi euismod nisl hendrerit varius id at orci. Maecenas aliquam tempor ex, at eleifend tortor sodales eget. Etiam enim mi, faucibus at quam in, dignissim sagittis lacus.", user_id: 2)

Question.create(title: "I have a Bromance and don't know what to do", content: "Phasellus hendrerit, metus id posuere sollicitudin, enim sapien tincidunt purus, vel pretium metus libero vitae lorem. Quisque mollis blandit dolor, vitae feugiat nibh egestas vitae. Vestibulum in felis tortor. Cras consequat vel ligula rhoncus fermentum. Phasellus nec aliquam quam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet nisl eu nisl dignissim rutrum vel a ipsum. Vivamus tempus eros at tincidunt dapibus. Fusce auctor libero risus, aliquet dignissim risus malesuada blandit. Nunc pretium dolor in vulputate faucibus. Donec tincidunt tortor ex, at sodales massa tempor vitae. Aenean varius sed ex non pulvinar. In auctor mi suscipit felis dapibus, at luctus diam consectetur. Curabitur eu est dictum, vestibulum libero eu, maximus felis. Etiam accumsan tincidunt lacus, vel commodo lectus. Mauris tincidunt eget erat sit amet ornare. Vivamus quis gravida eros. Duis tincidunt vulputate sapien, non efficitur turpis.", user_id: 1)


def random_question
  rand(1..4)
end

def random_user
  rand(1...4)
end

100.times {|answer| answer= Answer.create(title: Faker::Hipster.word, content: Faker::Hipster.sentence, user_id: random_user, question_id: random_question)}
