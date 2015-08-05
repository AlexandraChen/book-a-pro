# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# # User.destroy_all
# # puts "Deleting users"
# puts "Deleting old professionals"
# Professional.destroy_all
puts "Creating new professionals"

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
	"Sullivan",
	"Esteibar",
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
password= "12341234"
password_confirmation="12341234"

title=[
	"Fullstack developer and rock climber",
	"Fullstack developer",
	"Fullstack developer",
	"Fullstack developer and growth hacker",
	"Fullstack developer",
	"Fullstack developer",
	"Fullstack developer",
	"Fullstack developer",
	"Fullstack developer and online video specialist",
	"Fullstack developer",
	"Medical doctor",
	"Fullstack developer"

]

description=[
	#kevin
	"I'm a qualified ESL teacher with 3 years experience. I am also a graduate in Electronic Engineering and this is the field where I feel most challenged.
	
	My passion over the last year and a half has been programming. I am currently studying at the Ironhack coding bootcamp. My ambition is to become a full-stack web developer upon completion of the course.
	
	Skills: Ruby, Ruby on rails, HTML5, CSS3.",
	#shannon
	"Fullstack employee and soon-to-be fullstack developer. 
	
	I can explain the difference between UI and UX, know how to implement effective Growth Hacking, love presenting and can speak to both humans and computers (in 3 and 4 languages, respectively). I have a real soft spot for early-stage startups and emerging digital markets. 
	
	Non-human languages: HTML/CSS, JavaScript/jQuery, Ruby/Ruby on Rails. Human languages: English, Spanish and Portuguese.",
 #Unai
	"Hello world! I am Unai, Software Developer, mainly involved in web technologies.
	
	I have been around the coding world in part as a professional and in part as a student for 4 years, and in that time I have developed some desktop business applications and some open-source projects on my own.
	
	I am passionate about any kind of technology in general, and about the open ones in particular.
	
	Some of the technologies I have been working / playing with are: Javascript, Node.js, Angular.js, Java, Ruby, HTML5, Git...",
	#maegan
	"I am a New York City based Junior Full Stack Web Developer with a strong background in sales, economics, international law, social media management, event planning and more. Above all, my passions are marketing, design, clean code and team building. 
	
	As an aspiring Growth Hacker, I am looking to take advantage of my diverse marketing skills, clean design aesthetic and new-found passion for all things code to impact the future of my employer and its target audience. I do not wait for opportunities, I take them so I am looking for an employer who is just as hungry, who respects the hustle and appreciates the value of a smile.
	
	JavaScript // jQuery // Ruby // Ruby on Rails // Sinatra // HTML // CSS // ComScore // SalesForce",
	#oriol
	"I am willing to get involved in cutting edge projects in which I can apply my experience as Software Engineer, and my skills in web development. I am mainly into Ruby on Rails since I belive it's becoming the next big Web Dev technology.
	
	I am currently involved in the launch of a new startup called Dineyo: 'La app que te paga por comprar', which aims at changing the retail marketing and consuming paradigm.
	
	I am also skilled in other Software Engineering areas, so I can take active part in analysis and design activities, with a focus on software architectures.
	
	Since my second year in school, I have been working with the GESSI research group in UPC (a software engineering research group), so I have gained a lot of experience in different areas of SE and also in research.",
	#maria
	"Fullstack developer. JavaScript // jQuery // Ruby // Ruby on Rails // Sinatra // HTML // CSS ",
	#llorenc
	"Fullstack developer. Former manager and teaching assistand at IronHack",
	#andreu
	"IT professional with experience in consultancy and technological services. Focused on team and project management with high levels of responsiblity and adaptation skills. Educational background in software engineering reinforced by a broad experience dealing with the main technologies used by the industry. Specializing in Database design using Oracle PL/SQL and Java technologies.
	
	Particularly interested in staff motivation, project management and information system engineering.
	
	Specialties: Information Systems, Project Management, Team Leading and Oracle Database Systems.",
	#eliza
	"I use visual mediums to convey creative ideas. Based in Paris, France I am currently working as a freelancer with a variety of companies, brands and artists, helping them tell their stories. Video is my craft, the web is my platform. I also write, and dabble in (some) code.
	
	Previously, I worked as a video journalist and also had a brief but illuminating stint in advertising. My workhas spanned traditional, digital, design, and social platforms, all of which have allowed me to whittle down my main areas of expertise to brand development, and story development strategy.
	
	I have helped develop creative projects with Addidas, RedBull, Ubisoft, IGA Coke, Heineken, The 2010 Olympic Committee, La Presse Canadienne, Orange, Deezer, Sarenza, Vinci, UNEP, Orisue, Ed Banger, Marble, Scion (Toyota), YouTube, DailyMotion, and Radio France.",
	#alex
	"I'm an entrepreneur, industrial engineer and aspiring fullstack developer. Founder of Crush, a swimwear startup in Panama and student at IronHack Coding School.
	
	Assertive, decision maker, driven, team builder, oriented in great customer experience, persistent, flexible to adaptation, feedback oriented, able to get people on board that have to add to the vision, and open minded when there's a more efficient way to do something. I believe in learning by doing.",
	#luis
	"Médico Interno de II Categoría en el Hospital Santo Tomás. ",
	#thomas
	"Fullstack Academy of Code Computer Software Engineering"
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

user_id = [29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40]




# 1..12.times do |num|
# 	User.create(name: name[num], 
# 							last_name: last_name[num], 
# 							email: name[num]+"@hack.com", 
# 							prof_pic: File.open("app/assets/images/prof_pics/"+prof_pic[num]),
# 							password: password,
# 							password_confirmation: password_confirmation
# 	)
# end



1..12.times do |num|
	Professional.create(
							title: title[num],
							description: description[num],
							prof_pic: File.open("app/assets/images/prof_pics/"+prof_pic[num]),
							price_hr: 100,
							location: "The world",
							user_id: user_id[num]
	)
end








