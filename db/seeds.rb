# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

monster = User.create(
  username: 'CIsForCookie',
  email: "cookiemonster@gmail.com",
  password: "password")

bird = User.create(
  username: 'BigBird0723',
  email: "bigfeathers@gmail.com",
  password: "password")

ernie = User.create(
  username: 'ernieinthehouse69',
  email: "theoneandonly@gmail.com",
  password: "password")

monster_q = monster.questions.create(title: "Are there any rehab facilities around Sesame Street?",
  content: "Hey guys, this is a little embarassing but to try and stem my cookie addiction I decided to try black tar heroin. I'm now stuck in a downward spiral and can't find the light of day. Any suggestions?")

Answer.create(user: bird, question: monster_q, content: "Happens to the best of us, lord knows I've had my fair share of court-mandated rehab visits. I'd recommend the 'Sundown Rehab Salon'.")

bird_q = bird.questions.create(title: "Where can I buy a Chevy Astro Van?",
  content: "Looking for something with tinted windows, kinda like this one: http://classads.up.net/images/2013/06/25/1499/1996-astro-van_2.jpg, only darker if possible. Any ideas? Doesn't need to be clean.")

Answer.create(user: monster, question: bird_q, content: "Ah shoot, just sold mine :/")

ernie_q = ernie.questions.create(title: "How many people think think this joke is funny?",
  content: "One Monday morning, Grover picking up the kids along a new bus route. At the first stop, he picked up a fat little girl. Grover asked, 'What's your name?'' 'Patty' she replied. She had a seat in the back of the bus. On the next stop there was a handicapped boy named Ross. All the kids called him \"Special Ross.' Then a young man named Lester Cheese loaded onto the bus, sat down, took off his shoes and began picking at his bunyons.
  Finally the last stop came up, and another chubby little girl got on. Grover had never met her, so he asked her her name and her name was also Patty. On the way to school, Grover looked in his mirror and began to laugh, He was thinking... 'Damn, I have two obese Patty's, Special Ross, Lester Cheese picking bunyons, on a Sesame Street bus!'")

Answer.create(user: monster, question: ernie_q, content: "Die")