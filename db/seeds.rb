3.times do
    user = User.create(name: Faker::FunnyName.name, email: Faker::Internet.email)
    3.times do
        user.games.create(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph)
    end
end