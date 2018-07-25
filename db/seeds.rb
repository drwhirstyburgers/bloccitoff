require 'faker'

10.times do
  User.create(
    username: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    confirmed_at: Time.now,
    password: 'password'
  )
  users = User.all

  100.times do
    Item.create(
      user: users.sample,
      name: Faker::MichaelScott.quote
    )
  end
end
