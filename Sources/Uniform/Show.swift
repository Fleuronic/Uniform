// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Show

public extension Show {
	private static let nameReplacements = Resource.pairs("show-name-replacements")
	private static let names = Resource.map("show-names")
	private static let lowercaseWords = Resource.list("show-lowercase-words")
	private static let invalid = Resource.list("show-invalid")

	static func name(for record: String, in city: String?, year: Int) -> String {
		if record.range(of: "^(DCE|DCG|DCN|DCUK|DMG|IMBA) Contest", options: .regularExpression) != nil {
			return ""
		}

		var name = nameReplacements
			.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
			.replacingOccurrences(of: "^[0-9]+(st|nd|rd|th) Annual ", with: "", options: .regularExpression)
			.replacingOccurrences(of: " (19|20)\\d{2}", with: "", options: .regularExpression)
			.replacingOccurrences(of: "(19|20)\\d{2} ", with: "", options: .regularExpression)
			.components(separatedBy: " @ ").first!
			.components(separatedBy: " presented by ").first!
			.components(separatedBy: " Presents: ").last!

		name = if name == "iablo Valley Classic Pacific Open Class Championship Finals" {
			"D" + name
		} else {
			names[name] ?? name
		}

		name = switch (name, city, year) {
		case ("DCA World Championship Finals", "Kitchener", 2002), ("DCA World Championship Finals", "Kitchner", 2002): "Canadian Open Finals"
		case ("DCA World Championship Finals", "Holland", 2002), ("DCA World Championship Finals", "Grand Haven", 2002): "Coast Guard Open Finals"
		case ("Prelims", "Grand Haven", 2002): "Coast Guard Open Prelims"
		case ("Prelims", "Milton Keynes", 2001): "British Drum Corps Championship Prelims"
		case ("Drum Corps: An American Tradition", "Annapolis", 2018): "Drum Corps: An American Tradition – Annapolis"
		case ("Name TBD", "Great Bend", 2015): "March of Champions"
		case ("Name TBD", "Bakersfield", 2015): "Resound"
		case ("Name TBD", "St. Louis", 2015): "DCI Mid-America"
		case ("DCA Championships", "Syracuse", 2000): "DCA World Championship Finals"
		default: name
		}

		name = switch (name, year) {
		case ("DCI All Age Class Finals", 2024): "DCI All-Age World Championship"
		case ("Drums Across America", 2019): "Drums Across America – Atlanta"
		case ("Drums of Summer", 2017): "Tour of Champions – Oklahoma"
		case ("DCI Denton", 2017): "DCI North Texas"
		case ("DCI Jupiter", 2017): "DCI South Florida"
		case ("DCI Alabama", 2017): "DCI Southern Alabama"
		case ("DCI Oklahoma", 2016): "DCI Central Oklahoma"
		case ("DCI Central Oklahoma", 2013): "DCI in the Heartland"
		case ("DCI Northern Kentucky", 2016): "DCI Kentucky"
		case ("Drum Corps Competition", 2014): "Greendale Drum Corps Show"
		case ("Portland Summer Music Games", 2013): "Drums of Fire"
		case ("Boise Summer Music Games", 2015): "Drums Along the Rockies – Boise Edition"
		case ("Music on the Border", 2015): "Show of Shows"
		case ("Innovations in Brass – Massillon", 2019): "Innovations in Brass – North Canton"
		case ("Innovations in Brass – Akron", 2016): "Innovations in Brass – Massillon"
		case ("Tour of Champions – New Jersey", 2013): "Tour of Champions"
		case ("Tour of Champions – Chester", let year) where year < 2018: "Tour of Champions – PPL Park"
		case ("Diablo Valley Classic", let year) where [2018, 2022].contains(year): "Diablo Valley Classic Pacific Open Class Championship Finals"
		case ("DCI Southwestern Championship", 2001): "DCI Southwestern Championship – Evening"
		default: name
		}

		name = if name.contains("Soaring Sounds") {
			"Soaring Sounds"
		} else if name.contains("Southwest Corps Connection") {
			"Southwest Corps Connection"
		} else if name.contains("Western Corps Connection") {
			"Western Corps Connection"
		} else if name.contains("2013 DCI Tour Premiere") {
			"Innovations in Brass"
		} else {
			name
		}

		name = name
			.replacingOccurrences(of: " – Finals", with: " Finals")
			.replacingOccurrences(of: " – Prelims", with: " Prelims")
			.replacingOccurrences(of: "Championships Finals", with: "Championship Finals")
			.replacingOccurrences(of: "Championships Prelims", with: "Championship Prelims")

		for word in lowercaseWords {
			name = name.replacingOccurrences(of: " \(word.capitalized) ", with: " \(word) ")
		}

		return name
	}

	static func slug(forShowNamed name: String, in year: Int) -> String? {
		guard isValid(with: name) else { return nil }

		return name
			.lowercased()
			.replacingOccurrences(of: ":", with: "")
			.replacingOccurrences(of: "!", with: "")
			.replacingOccurrences(of: ".", with: "")
			.replacingOccurrences(of: "&", with: "")
			.replacingOccurrences(of: "’", with: "-")
			.replacingOccurrences(of: " – ", with: " ")
			.replacingOccurrences(of: " ", with: "-")
	}

	static func scoreSlug(for slug: String, in city: String?, year: Int) -> String {
		var scoreSlug = switch (slug, year) {
		case ("dci-open-class-world-championship-finals", 2022): "open-class-world-championship-finals"
		case ("dci-all-age-world-championship-finals", 2025): "dci-all-age-world-championship"
		case ("drum-corps-an-american-tradition", 2018): "drum-corps-an-america-tradition"
		case ("drum-corps-an-american-tradition-2", 2018): "drum-corps-an-american-tradition"
		case ("tour-of-champions-oklahoma", 2017): "tour-of-champions-oklahoma-presented-by-drums-of-summer"
		case ("dci-open-class-world-championship-prelims", 2013): "dci-world-championships-open-class-championship-prelims"
		case ("dci-open-class-world-championship-finals", 2013): "dci-championships-open-class-championship-finals"
		case ("dci-open-class-world-championship-finals", year) where [2014, 2015].contains(year): "dci-world-championships-open-class-championship-finals"
		case ("dci-open-class-world-championship-prelims", year) where [2014, 2015].contains(year): "dci-world-championships-open-class-championship-prelims"
		case ("dci-open-class-world-championship-prelims", let year) where year < 2018: "dci-open-class-world-championships-prelims"
		case ("dci-open-class-world-championship-finals", let year) where year < 2018: "dci-open-class-world-championships-finals"
		case ("dci-world-championship-finals", let year) where [2014, 2016].contains(year): "dci-world-championships-finals"
		case ("dci-world-championship-finals", 2015): "dci-world-championship-world-class-finals"
		case ("dci-world-championship-prelims", 2013): "dci-world-championships-prelims"
		case ("dci-world-championship-semifinals", 2013): "dci-world-championships-semifinals"
		case ("dci-southeastern-championship", let year) where year >= 2013 && year <= 2015: "dci-atlanta-southeastern-championship"
		case ("tour-of-champions-northern-illinois", 2016): "tour-of-champions-north-illinois"
		case ("tour-of-champions-texas", 2013): "tour-of-championships-texas"
		case ("dci-capitol-classic", 2013): "dci-capitol-classic-corps-show"
		case ("pacific-procession", 2015): "pacific-proscession"
		case ("shoremen-brass-classic", 2015): "shoreman-brass-classic"
		case ("dci-eastern-classic", let year) where year >= 2013 && year <= 2018: "dci-eastern-classic-2"
		case ("dci-eastern-classic-2", let year) where year >= 2013 && year <= 2018: "dci-eastern-classic"
		default: slug
		}

		scoreSlug = switch (slug, city, year) {
		case ("drum-corps-an-american-tradition-3", "Annapolis", 2017): "drum-corps-an-american-tradition"
		case ("drum-corps-an-american-tradition", "Allentown", 2017): "drum-corps-an-american-tradition-3"
		case ("drum-corps-an-american-tradition-3", "Annapolis", 2016): "drum-corps-an-american-tradition"
		case ("drum-corps-an-american-tradition", "Allentown", 2016): "drum-corps-an-american-tradition-3"
		case ("drum-corps-an-american-tradition", "Allentown", 2015): "drum-corps-an-american-tradition-3"
		case ("drum-corps-an-american-tradition-3", "Annapolis", 2015): "drum-corps-an-american-tradition"
		case ("drum-corps-an-american-tradition", "Jackson", 2014): "drum-corps-an-american-tradition-3"
		case ("drum-corps-an-american-tradition-2", "Chambersburg", 2014): "drum-corps-an-american-tradition-4"
		case ("drum-corps-an-american-tradition-3", "Chester", 2014): "drum-corps-an-american-tradition-2"
		case ("drum-corps-an-american-tradition-4", "West Chester", 2014): "drum-corps-an-american-tradition"
		case ("show-of-shows", "Rockford", 2014): "show-of-shows-2"
		case ("show-of-shows-2", "Metamora", 2014): "show-of-shows"
		case ("show-of-shows", "Rockford", 2015): "show-of-shows-2"
		case ("show-of-shows-2", "Waukesha", 2015): "show-of-shows"
		case ("drum-corps-an-american-tradition", "Chambersburg", 2013): "drum-corps-an-american-tradition-2"
		case ("drum-corps-an-american-tradition-2", "West Chester", 2013): "drum-corps-an-american-tradition"
		default: scoreSlug
		}

		return scoreSlug
	}

	static func isValid(with name: String?)  -> Bool {
		guard let name else { return true }

		return !invalid.contains { name.contains($0) }
	}
}
