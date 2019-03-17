# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    MinskR = Province.create(name: 'Минская')
    VitebskR = Province.create(name: 'Витебская')
    GomelR = Province.create(name: 'Гомельская')
    MogilevR = Province.create(name: 'Могилевская')
    BrestR = Province.create(name: 'Брестская')
    GrodnoR = Province.create(name: 'Гродненская')
    minsk = City.create(name: "Минск", post_index: "112233", province: MinskR)
    a1 = Administration.create(name: "Капиталистический", city: minsk)
    a2 = Administration.create(name: "Либеральный", city: minsk)
    a3 = Administration.create(name: "Китайскийсоциализм", city: minsk)
    a4 = Administration.create(name: "Совет ", city: minsk)
    Region.create(name: "Район1", administration: a1)
    Region.create(name: "Район2", administration: a2)
    Region.create(name: "Район3", administration: a3)
    Region.create(name: "Район4", administration: a4)
    
    10.times do
      User.create!(email: Faker::Internet.email, confirmed_at: Time.now, password: "111111", role: Role.first(2)[1], region: Region.last, first_name: Faker::Beer.name, last_name: Faker::Beer.name)
    end