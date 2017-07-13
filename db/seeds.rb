# Admin1 User
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

# Admin2 User
User.create!(name:  "endu",
            email: "endu@email.com",
            password:              "kmkm1201",
            password_confirmation: "kmkm1201",
            admin: true)



99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
