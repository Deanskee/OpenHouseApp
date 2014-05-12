# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Agent.destroy_all
Visitor.destroy_all
Location.destroy_all

# wipes database before adding new people. so no duplication

agents = Agent.create([
	{first_name: 'Charles',
	 last_name: 'Manson',
	 email: 'Charles.Manson@gmail.com'},

	{first_name: 'OJ',
	 last_name: 'Simpson',
	 email: 'OJ.Simpson@gmail.com'},

	 {first_name: 'Ted',
	 last_name: 'Bundy',
	 email: 'Ted.Bundy@gmail.com'}
])

visitors = Visitor.create([
	 {first_name: 'Jim',
	 last_name: 'Jones',
	 email: 'Jim.Jones@gmail.com'},

	 {first_name: 'Juelz',
	 last_name: 'Santana',
	 email: 'Juelz.Santana@gmail.com'},

	 {first_name: 'Camron',
	 last_name: 'Giles',
	 email: 'Camron.Giles@gmail.com'}
])

locations = Location.create([
	 {address: '9665 Wilshire Blvd',
	 zip_code: 90212,
	 owner: 'Marc Johnson'},

	 {address: '912 Bel Air Drive',
	 zip_code: 91210,
	 owner: 'Will Smith'},

	 {address: '122 Tigertail Drive',
	 zip_code: 91235,
	 owner: 'Brett Michaels'}

])
