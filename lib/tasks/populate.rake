namespace :db do
	desc "Erase and fill database"
	task populate: :environment do
		require 'faker'
		Rake::Task['db:reset'].invoke

		address = [
								['2244 Hastings Street', 'Burnaby', 'V5C2H5'],
								['1326 Davie St', 'Vancouver', 'V6E1N6'],
								['1176 Nassau Drive', 'Vancouver', 'V5P2B5'],
								['6719 Silver Avenue', 'Burnaby', 'V5H2Y7'],
								['3380 Imperial Street', 'Burnaby', 'V5J1A2']
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
				address: x[0],
				city: x[1],
				province: 'British Columbia',
				postal_code: x[2],
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
			address: '701 West Georgia Street',
			city: 'Vancouver',
			province: 'British Columbia',
			postal_code: 'V7Y1G5',
			password: '123456',
			password_confirmation: '123456'
		)

		50.times do |x|
			add = Faker::Address.street_address
			fn = Faker::Name.first_name
			ln = Faker::Name.last_name
			pn = Faker::PhoneNumber.cell_phone
			@patient = Patient.create!(
				care_id: Faker::Number.between(9845000000, 9999999999),
				first_name: fn,
				last_name: ln,
				email: Faker::Internet.email,
				sex: ["Male", "Female"].sample,
				age: rand(30..90),
				address: add,
				city: Faker::Address.city,
				province: Faker::Address.state,
				postal_code: Faker::Address.zip,
				phone: "#{pn}",
				password: '123456',
				password_confirmation: '123456',
				clinician_id: rand(1..5),
			)
		end

		@patient = Patient.create!(
			care_id: '9845111111',
			first_name: 'Roderick',
			last_name: 'Fung',
			email: 'roderickfung@gmail.com',
			age: 27,
			sex: "Male",
			address: '1128 West Georgia Street',
			city: 'Vancouver',
			province: 'British Columbia',
			postal_code: 'V6E0A8',
			phone: '7783211711',
			password: 'r2d34k5',
			password_confirmation: 'r2d34k5',
			clinician_id: 6
		)

		@patient = Patient.create!(
			care_id: '9845111112',
			first_name: 'John',
			last_name: 'Lai',
			email: 'jlai@gmail.com',
			age: 29,
			sex: "Male",
			address: '6333 148 Street',
			city: 'Surrey',
			province: 'British Columbia',
			postal_code: 'V3S3G3',
			phone: '1234789148',
			password: '123456',
			password_confirmation: '123456',
			clinician_id: 6
		)

		@patient = Patient.create!(
			care_id: '9845111113',
			first_name: 'John',
			last_name: 'Smith',
			email: 'jsmith@gmail.com',
			age: 62,
			sex: "Male",
			address: '5585 46 Avenue',
			city: 'Delta',
			province: 'British Columbia',
			postal_code: 'V4K3V9',
			phone: Faker::PhoneNumber.cell_phone,
			password: '123456',
			password_confirmation: '123456',
			clinician_id: 6
		)

		@patient = Patient.create!(
			care_id: '9845111121',
			first_name: 'Stacy',
			last_name: 'Picard',
			email: 'spicard@gmail.com',
			age: 82,
			sex: "Female",
			address: '3585 W 11th Ave',
			city: 'Vancouver',
			province: 'British Columbia',
			postal_code: 'V6R2K3',
			phone: Faker::PhoneNumber.cell_phone,
			password: '123456',
			password_confirmation: '123456',
			clinician_id: 6
		)

		@patient = Patient.create!(
			care_id: '9845111114',
			first_name: 'Jennifer',
			last_name: 'Lui',
			email: 'jlui55@gmail.com',
			age: 41,
			sex: "Female",
			address: '2134 Semlin Dr',
			city: 'Vancouver',
			province: 'British Columbia',
			postal_code: 'V5N4R3',
			phone: Faker::PhoneNumber.cell_phone,
			password: '123456',
			password_confirmation: '123456',
			clinician_id: 6
		)

		@patient = Patient.create!(
			care_id: '9845111115',
			first_name: 'Oliver',
			last_name: 'Bertrand',
			email: 'oliverbertrand@gmail.com',
			age: 88,
			sex: "Male",
			address: '2860 Triumph St',
			city: 'Vancouver',
			province: 'British Columbia',
			postal_code: 'V5K1T5',
			phone: Faker::PhoneNumber.cell_phone,
			password: '123456',
			password_confirmation: '123456',
			clinician_id: 6
		)

		@patient = Patient.create!(
			care_id: '9845111116',
			first_name: 'Olivia',
			last_name: 'Munn',
			email: 'omunn@gmail.com',
			age: 31,
			sex: "Female",
			address: '125 3rd Street West',
			city: 'North Vancouver',
			province: 'British Columbia',
			postal_code: 'V7M1E7',
			phone: Faker::PhoneNumber.cell_phone,
			password: '123456',
			password_confirmation: '123456',
			clinician_id: 6
		)

		@patient = Patient.create!(
			care_id: '9845111117',
			first_name: 'Taylor',
			last_name: 'Humdinger',
			email: 'thumdinger@gmail.com',
			age: 62,
			sex: "Male",
			address: '547 20th Street West',
			city: 'North Vancouver',
			province: 'British Columbia',
			postal_code: 'V7M1Y8',
			phone: Faker::PhoneNumber.cell_phone,
			password: '123456',
			password_confirmation: '123456',
			clinician_id: 6
		)

		@patient = Patient.create!(
			care_id: '9845111118',
			first_name: 'Kim',
			last_name: 'Seoyeung',
			email: 'kimsy@gmail.com',
			age: 52,
			sex: "Female",
			address: '2966 Corona Drive',
			city: 'Burnaby',
			province: 'British Columbia',
			postal_code: 'V3J1B8',
			phone: Faker::PhoneNumber.cell_phone,
			password: '123456',
			password_confirmation: '123456',
			clinician_id: 6
		)

		@patient = Patient.create!(
			care_id: '9845111119',
			first_name: 'Sylvie',
			last_name: 'Wong',
			email: 'sylvie92@gmail.com',
			age: 22,
			sex: "Female",
			address: '355 Duthie Avenue',
			city: 'Burnaby',
			province: 'British Columbia',
			postal_code: 'V5A2P3',
			phone: Faker::PhoneNumber.cell_phone,
			password: '123456',
			password_confirmation: '123456',
			clinician_id: 6
		)

		@patient = Patient.create!(
			care_id: '9845111120',
			first_name: 'Morgan',
			last_name: 'Reilly',
			email: 'mreilly@gmail.com',
			age: 38,
			sex: "Male",
			address: '2451 McGill Street',
			city: 'Vancouver',
			province: 'British Columbia',
			postal_code: 'V5K1G7',
			phone: Faker::PhoneNumber.cell_phone,
			password: '123456',
			password_confirmation: '123456',
			clinician_id: 6
		)


		@counter = (100).downto(8).to_a
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

	end
end
