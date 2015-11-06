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

Group.create(name: "TIY Gamers")
Group.create(name: "The Group With the Really Long Name")
Group.create(name: "The Red Shirts")
Group.create(name: "One last group name")

User.create(name: "Billy Bananas")
User.create(name: "Jon Snow")
User.create(name: "Robert Paulson")
User.create(name: "Buzz Lightyear")
User.create(name: "John Cena")
User.create(name: "Sarah Sobczak")
User.create(name: "Gavin Stark", email: "gavin@theironyard.com")

virgil = User.create(name: "Virgil Diaz")
virgil.memberships.create(group_id: 1)


brandon = User.create(name: "Brandon Fitch")
brandon.memberships.create(group_id: 1)


luke = User.create(name: "Luke Diaz")
luke.memberships.create(group_id: 1)


kanye = User.create(name: "Kanye West")
kanye.memberships.create(group_id: 3)

ron = User.create(name: "Ron Swanson")
ron.memberships.create(group_id: 3)

paul = User.create(name: "Paul Walker")
paul.memberships.create(group_id: 3)

ron = User.create(name: "Ron Weasley")
ron.memberships.create(group_id: 3)
