# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cadet_list = [
	['10525536', 'Bravo'],
	['11111111', 'Bravo'],
	['12345678', 'Charlie'],
	['87654321', 'Delta']
]

candidate_list = [
	['Smith Gaddy','Bravo'],
	['Bo Lowry','Bravo'],
	['Gus McKnight','Bravo'],
	['Dylan Yates','Bravo'],
	['One Guy','Charlie'],
	['Next Guy','Charlie'],
	['Last Guy','Charlie']
]

ballad_list = [
	['10525536', '1'],
	['10525536', '1'],
	['10525536', '1'],
	['10525536', '2'],
	['10525536', '3'],
	['10525536', '3'],
	['12345678', '6']
]

cadet_list.each do |cwid, company|
	Cadet.create(cwid: cwid, company: company)
end

candidate_list.each do |name, company|
	Candidate.create(name: name, company: company)
end

ballad_list.each do |cadetCwid, candidateId|
	Ballad.create(cadetCwid: cadetCwid, candidateId: candidateId)
end

