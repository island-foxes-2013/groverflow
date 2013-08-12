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

monster_q = monster.questions.create(title: "Are there any rehab facilities around Sesame Street?",
  content: "Hey guys, this is a little embarassing but to try and stem my cookie addiction I decided to try black tar heroin. I'm now stuck in a downward spiral and can't find the light of day. Any suggestions?")

Answer.create(user: bird, question: monster_q, content: "Happens to the best of us, lord knows I've had my fair share of court-mandated rehab visits. I'd recommend the 'Sundown Rehab Salon'")
