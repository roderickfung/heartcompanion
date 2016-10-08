namespace :db do
	desc "Erase and fill database"
	task populate: :environment do
		require 'faker'
		Rake::Task['db:reset'].invoke

		address = [
								'2244 Hastings Street, Vancouver',
								'1326 Davie St, Vancouver',
								'6006 Burning Passage, Anyox',
								'615 Cotton Spring Circle, Donald Landing',
								'5319 Quiet Fox Terrace, Blaeberry'
							]

		address.each do |x|
			fn = Faker::Name.first_name
			ln = Faker::Name.last_name
			full_name = "#{fn}#{ln}"
			@clinician = Clinician.create!(
				first_name: fn,
				last_name: ln,
				username: full_name,
				email: Faker::Internet.email,
				phone: Faker::PhoneNumber.phone_number,
				address: x,
				password: '123456',
				password_confirmation: '123456'
			)
		end

		@clinician = Clinician.create!(
			first_name: 'David',
			last_name: 'Mo',
			username: 'mdavid',
			email: 'davidcfmo@gmail.com',
			phone: '1234567890',
			address: '9110 Maple Court, Richmond, BC',
			password: '123456',
			password_confirmation: '123456'
		)

		50.times do |x|
			add = Faker::Address.street_address
			fn = Faker::Name.first_name
			ln = Faker::Name.last_name
			pn = Faker::PhoneNumber.phone_number
			@patient = Patient.create!(
				care_id: Faker::Number.between(9845000000, 9999999999),
				first_name: fn,
				last_name: ln,
				email: Faker::Internet.email,
				sex: ["Male", "Female"].sample,
				age: rand(30..90),
				address: add,
				phone: "#{pn.to_i}",
				password: '123456',
				password_confirmation: '123456',
				clinician_id: rand(1..6),
			)
		end

		@patient = Patient.create!(
			care_id: '9845412517',
			first_name: 'Roderick',
			last_name: 'Fung',
			email: 'roderickfung@gmail.com',
			age: 27,
			sex: "Male",
			address: '#206 - 14088 Riverport Way, Richmond. BC',
			phone: '7783211711',
			password: 'r2d34k5',
			password_confirmation: 'r2d34k5',
			clinician_id: 6
		)

		@counter = (1..100).to_a
		@counter.each do |counter|
			Patient.all.each do |patient|
				@patient_log = PatientLog.create!(
				patient_id: patient.id,
				date: counter.days.ago,
				heartrate: rand(55..120),
				bp_hi: rand(80..180),
				bp_low: rand(40..100),
				weight_num: rand(90..250),
				exerting_breath: rand(-10..10),
				night_breath: rand(-10..10),
				leg_swollen: rand(-10..10),
				lightheadedness: rand(-10..10),
				)
			end
		end

		# 1000.times do |x|
		# 	@patient_log = PatientLog.create!(
		# 		patient_id: rand(1..51),
		# 		date: rand(1..365).days.ago,
		# 		heartrate: rand(55..120),
		# 		bp_hi: rand(80..180),
		# 		bp_low: rand(50..100),
		# 		weight_num: rand(90..200),
		# 		exerting_breath: rand(-10..10),
		# 		night_breath: rand(-10..10),
		# 		leg_swollen: rand(-10..10),
		# 		lightheadedness: rand(-10..10)
		# 	)
		# end
	end
end
