# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Profile.create!({
                    full_name: 'Faizan Ahmad',
                    title: 'Full Stack Engineer (Ruby On Rails) | Node.Js',
                    email: 'faizu_ali@ayhoo.com',
                    web_url: 'http://www.faizan.com',
                    phone: '+923338184261',
                    address: 'Lahore, PK',
                    image: 'https://media-exp2.licdn.com/mpr/mpr/shrinknp_400_400/AAIAAwDGAAAAAQAAAAAAAAuzAAAAJDM1ZGYwNmExLWNjMTktNDAxNi1hYWFkLTU4MzUwNmQ3NzJmZQ.jpg',
                    about: 'Hi! I’m Faizan. I’m a developer dedicated to bringing cool experiences to life.I am much
interested in mobile and web technologies. I have worked on multiple sites during my career and have been able to learn
a lot of every single one of them.The ambition of my life is to turn out to be a victorious software engineer and creative
solutions provider.I am always open to work on new technologies or entering new areas with interesting problems to solve.
'} )