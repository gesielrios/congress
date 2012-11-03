# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.create(:description => "Em analise")
Status.create(:description => "Aceito")
Status.create(:description => "Recusado")

User.create(:name => "Congresso FAESF ADMIN", 
            :email => "congressofaesf@gmail.com",
            :password => "congressofaesf2012",
            :password_confirmation => "congressofaesf2012")
