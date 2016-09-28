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
				address: x,
				password: '123456',
				password_confirmation: '123456'
			)
		end

	end
end
