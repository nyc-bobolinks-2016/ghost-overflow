10.times {|user| user =
  User.create(full_name: Faker::StarWars.character, email: Faker::Internet.email, password: "password")}
