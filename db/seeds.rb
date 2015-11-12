Group.create(name: "TIY Game Group", group_image: File.new(Rails.root.join("app/assets/images/tiy.png")))
Group.create(name: "Work Buddies")
Group.create(name: "FSU Crew", group_image: File.new(Rails.root.join("app/assets/images/fsu.jpg")))

User.create(name: "John Cena", email: "gamenightapp1@gmail.com", image: "http://img.bleacherreport.net/img/slides/photos/002/591/879/john-cena-john-cena-17404725-356-378_crop_north.jpg?w=630&h=420&q=75")
User.create(name: "Buzz Lightyear", email: "gamenightapp2@gmail.com", image: "http://img1.wikia.nocookie.net/__cb20130101220439/disney/images/e/e3/Buzz_Lightyear_out_of_the_box.jpg")
User.create(name: "Ronda Rousey", image: "http://www.technobuffalo.com/wp-content/uploads/2015/08/ronda-rousey-blue.jpg")
User.create(name: "Felicia Day", image: "https://upload.wikimedia.org/wikipedia/commons/7/79/Felicia_Day_2012.jpg")
User.create(name: "Gavin Stark", email: "gavin@theironyard.com", image: "https://avatars2.githubusercontent.com/u/2607?v=3&s=460")

bob = User.create(name: "Bob Barker", image: "http://media4.popsugar-assets.com/files/users/0/88/23_2007/BobBarker_Jorda_14247516_400.jpg")
bob.memberships.create(group_id: 3)

ron = User.create(name: "Ron Swanson", image: "http://starsmedia.ign.com/stars/image/object/042/042411/ron-swanson_parks_pictureboxart_160w.jpg")
ron.memberships.create(group_id: 3)

jon = User.create(name: "Jon Snow", image: "https://www.euruni.edu/blog/wp-content/uploads/2015/07/Jon-Snow-4.jpg")
jon.memberships.create(group_id: 3)
