# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.upto(20) do |num|                                                   
    Blog.create!(title:"Blog#{num}",content:"blog's deatails#{num}")       
end   

Admin.create!(email:"admin@gmail.com",password:"admin123",admin:true)
