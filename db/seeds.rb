# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
puts "Deleting users"

puts "Creating new users"

name = [
	"Kevin",
	"Shannon",
	"Unai",
	"Maegan",
	"Oriol",
	"Maria",
	"Llorenç",
	"Andreu",
	"Eliza",
	"Alexandra",
	"Luis",
	"Thomas"
]
last_name = [
	"Price",
	"Esteibar",
	"Sullivan",
	"Burke",
	"Collel",
	"Comas",
	"Muntaner",
	"Masferrer",
	"Struthers-Jobin",
	"Chen",
	"Riba",
	"Proenza"
]

prof_pic = [
	"kevin.jpg",
	"shannon.jpg",
	"unai.jpg",
	"maegan.jpg",
	"oriol.jpg",
	"maria.jpg",
	"llorenc.jpg",
	"andreu.jpg",
	"eliza.jpg",
	"alexandra.jpg",
	"luis.jpg",
	"tom.jpg"
]

password= "12341234"
password_confirmation="12341234"


1..12.times do |num|
	User.create(name: name[num], 
							last_name: [:last_name], 
							email: name[num]+"@hack.com", 
							prof_pic: File.open("app/assets/images/prof_pics/"+prof_pic[num]),
							password: password,
							password_confirmation: password_confirmation
	)
end









