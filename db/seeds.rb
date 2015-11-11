# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create a few groups
# Create a few users
# Put some of the users in some of the groups

Group.create(name: "TIY Game Group")
Group.create(name: "Work Buddies")
Group.create(name: "FSU Friends")

User.create(name: "John Cena", image: "http://img.bleacherreport.net/img/slides/photos/002/591/879/john-cena-john-cena-17404725-356-378_crop_north.jpg?w=630&h=420&q=75")
User.create(name: "Jon Snow", image: "https://www.euruni.edu/blog/wp-content/uploads/2015/07/Jon-Snow-4.jpg")
User.create(name: "Ronda Rousey", image: "http://www.technobuffalo.com/wp-content/uploads/2015/08/ronda-rousey-blue.jpg")
User.create(name: "Buzz Lightyear", image: "http://img1.wikia.nocookie.net/__cb20130101220439/disney/images/e/e3/Buzz_Lightyear_out_of_the_box.jpg")
User.create(name: "Bob Barker", image: "http://media4.popsugar-assets.com/files/users/0/88/23_2007/BobBarker_Jorda_14247516_400.jpg")
User.create(name: "Felicia Day", image: "https://upload.wikimedia.org/wikipedia/commons/7/79/Felicia_Day_2012.jpg")
User.create(name: "Gavin Stark", email: "gavin@theironyard.com", image: "https://avatars2.githubusercontent.com/u/2607?v=3&s=460")


kanye = User.create(name: "Kanye West", image: "http://static.spin.com/files/styles/style820_546/public/121004-kanye-west.jpg")
kanye.memberships.create(group_id: 3)

ron = User.create(name: "Ron Swanson", image: "http://starsmedia.ign.com/stars/image/object/042/042411/ron-swanson_parks_pictureboxart_160w.jpg")
ron.memberships.create(group_id: 3)

paul = User.create(name: "Paul Walker", image: "http://ia.media-imdb.com/images/M/MV5BOTk4MTI3Nzc3M15BMl5BanBnXkFtZTYwNjgyODE3._V1_SX640_SY720_.jpg")
paul.memberships.create(group_id: 3)
