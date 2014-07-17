namespace :db do
	desc "Fill database with card info from Excel file"
	task populate: :environment do
		sheet = Roo::Excelx.new('flashcards_july2014.xlsx')
		deck = Deck.create(title: "Yoga Flashcards July 2014")

		(1..sheet.last_row).each do |r|
			row = sheet.row(r)
			side_one = row[0]
			side_two = row[1]

			deck.flashcards.create(side_one: side_one, side_two: side_two)
		end

	end
end