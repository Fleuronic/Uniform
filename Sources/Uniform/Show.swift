import struct DrumKit.Show

public extension Show {
	static func name(for record: String, in city: String?, year: Int) -> String {
		var name = record
			.replacingOccurrences(of: "- ", with: "– ")
			.replacingOccurrences(of: "--", with: "–")
			.replacingOccurrences(of: "?", with: "–")
			.replacingOccurrences(of: "'", with: "’")
			.replacingOccurrences(of: "  ", with: " ")
			.replacingOccurrences(of: " Corps Show", with: "")
			.replacingOccurrences(of: "&amp;", with: "&")
			.replacingOccurrences(of: "@ the Glen", with: "at the Glen")
			.replacingOccurrences(of: " 2018", with: "")
			.replacingOccurrences(of: ". Drum", with: "Drum")
			.replacingOccurrences(of: "Barnum Festival Champions", with: "Barnum Festival: Champions")
			.replacingOccurrences(of: "Innovations in Brass:", with: "Innovations in Brass –")
			.replacingOccurrences(of: "Tour of Champions:", with: "Tour of Champions –")
			.replacingOccurrences(of: "Brigadiers", with: "Brigadier’s")
			.replacingOccurrences(of: "Drum Along", with: "Drums Along")
			.replacingOccurrences(of: "Champions,", with: "Champions")
			.replacingOccurrences(of: "Crest San,", with: "Crest – San")
			.replacingOccurrences(of: "Crest Los,", with: "Crest – Los")
			.replacingOccurrences(of: "Crest Walnut,", with: "Crest – Walnut")
			.replacingOccurrences(of: "Games Portland", with: "Games – Portland")
			.replacingOccurrences(of: "Games Seattle", with: "Games – Seattle")
			.replacingOccurrences(of: "Shows Waukesha", with: "Shows – Waukesha")
			.replacingOccurrences(of: "Jerset", with: "Jersey")
			.replacingOccurrences(of: "LaCrosse", with: "La Crosse")
			.replacingOccurrences(of: "Masters Summer", with: "Masters of the Summer")
			.replacingOccurrences(of: "Rhapsody-Metamora", with: "Rhapsody – Metamora")
			.replacingOccurrences(of: "Rhapsody-La Crosse", with: "Rhapsody – La Crosse")
			.replacingOccurrences(of: "Mid-Cal", with: "MidCal")
			.replacingOccurrences(of: "Northwest Music Games", with: "Northwest Youth Music Games")
			.replacingOccurrences(of: "SoCal", with: "So Cal")
			.replacingOccurrences(of: "Southeastern Regional", with: "Southeastern Championship")
			.replacingOccurrences(of: "Southwestern Regional", with: "Southwestern Championship")
			.replacingOccurrences(of: "SUMMER MUSIC GAMES", with: "Summer Music Games")
			.replacingOccurrences(of: "NATIONALS", with: "Nationals")
			.replacingOccurrences(of: "Tradition–", with: "Tradition –")
			.replacingOccurrences(of: "Texas,", with: "Texas")
			.replacingOccurrences(of: "Mississippi River,", with: "Mississippi")
			.replacingOccurrences(of: "The DCI South", with: "DCI South")
			.replacingOccurrences(of: ", the 2014 DCI Tour Premiere", with: "")
			.replacingOccurrences(of: "– A DCI/DCA split event!", with: "")
			.components(separatedBy: " @ ").first!
			.components(separatedBy: " presented by ").first!

		name = switch name {
		case "CrownBeat": "CrownBEAT"
		case "DCI Manchester, NH": "DCI New Hampshire"
		case "DCI Masters": "The Masters of the Summer Music Games"
		case "DCI Open Prelims": "DCI Open Class World Championship Prelims"
		case "DCI Open Finals", "DCI Open Class Finals", "DCI World Championships Open Class Championship Finals": "DCI Open Class World Championship Finals"
		case "DCI Open Class Prelims", "DCI World Championships Open Class Championship Prelims": "DCI Open Class World Championship Prelims"
		case "DCI Finals", "DCI World Class Finals", "DCI World Championships World Class Finals": "DCI World Championship Finals"
		case "DCI Prelims", "DCI World Class Prelims": "DCI World Championship Prelims"
		case "DCI Semifinals", "DCI World Class Semi-Finals": "DCI World Championship Semifinals"
		case "DCI Southeastern", "DCI Atlanta Southeastern Championship": "DCI Southeastern Championship"
		case "DCI Southwestern": "DCI Southwestern Championship"
		case "DCI Sioux City": "DCI Morningside"
		case "Drum Corps in Northern Virginia": "Drums in Northern Virginia"
		case "Drums Across the Columbia": "Drums Along the Columbia"
		case "Drums Along The Mississippi": "Drums Along the Mississippi River"
		case "Drums Corps: An American Tradition – Metro": "Drums Corps: An American Tradition – Clifton"
		case "Drums at the Rose Bowl": "Drum Corps at the Rose Bowl"
		case "Gold Showcase (Drum Corps at the Glen)": "Gold Showcase"
		case "March On": "March On!"
		case "Nightbeat", "NightBeat": "NightBEAT"
		case "Summer Music Games of Southern Virginia": "Summer Music Games of Southwest Virginia"
		case "Tour Premiere": "Midwest Premiere"
		case "iablo Valley Classic Pacific Open Class Championship Finals": "D" + name
		default: name
		}

		name = switch (name, city, year) {
		case ("Drum Corps: An American Tradition", "Annapolis", 2018): "Drum Corps: An American Tradition – Annapolis"
		case ("Name TBD", "Great Bend", 2015): "March of Champions"
		case ("Name TBD", "Bakersfield", 2015): "Resound"
		case ("Name TBD", "St. Louis", 2015): "DCI Mid-America"
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
		case ("Portland Summer Music Games", 2013): "Drums of Fire"
		case ("Boise Summer Music Games", 2015): "Drums Along the Rockies – Boise Edition"
		case ("Music on the Border", 2015): "Show of Shows"
		case ("Innovations in Brass – Massillon", 2019): "Innovations in Brass – North Canton"
		case ("Innovations in Brass – Akron", 2016): "Innovations in Brass – Massillon"
		case ("Tour of Champions – New Jersey", 2013): "Tour of Champions"
		case ("Tour of Champions – Chester", let year) where year < 2018: "Tour of Champions – PPL Park"
		case ("Diablo Valley Classic", let year) where [2018, 2022].contains(year): "Diablo Valley Classic Pacific Open Class Championship Finals"
		default: name
		}

		name = if name.contains("Soaring Sounds") {
			"Soaring Sounds"
		} else if name.contains("Southwest Corps Connection") {
			"Southwest Corps Connection"
		} else if name.contains("2013 DCI Tour Premiere") {
			"Innovations in Brass"
		} else {
			name
		}

		for word in ["in", "on", "to", "the", "with", "of", "de"] {
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
		case ("dci-southeastern-championship", let year) where year >= 2014 && year <= 2015: "dci-atlanta-southeastern-championship"
		case ("tour-of-champions-northern-illinois", 2016): "tour-of-champions-north-illinois"
		case ("tour-of-champions-texas", 2013): "tour-of-championships-texas"
		case ("dci-capitol-classic", 2013): "dci-capitol-classic-corps-show"
		case ("dci-on-the-so-cal-coast", _): "dci-on-the-socal-coast"
		case ("pacific-procession", 2015): "pacific-proscession"
		case ("shoremen-brass-classic", 2015): "shoreman-brass-classic"
		default: slug
		}

		scoreSlug = switch (slug, city, year) {
		case ("drum-corps-an-american-tradition", "Annapolis", 2017): "drum-corps-an-american-tradition"
		case ("drum-corps-an-american-tradition", "Allentown", 2017): "drum-corps-an-american-tradition-3"
		case ("drum-corps-an-american-tradition", "Clifton", 2017): "drum-corps-an-american-tradition-2"
		case ("drum-corps-an-american-tradition", "Allentown", 2015): "drum-corps-an-american-tradition-3"
		case ("drum-corps-an-american-tradition", "Clifton", 2015): "drum-corps-an-american-tradition-2"
		case ("drum-corps-an-american-tradition", "Chambersburg", 2014): "drum-corps-an-american-tradition-4"
		case ("drum-corps-an-american-tradition", "Jackson", 2014): "drum-corps-an-american-tradition-3"
		case ("drum-corps-an-american-tradition", "Chester", 2014): "drum-corps-an-american-tradition-2"
		case ("drum-corps-an-american-tradition", "West Chester", 2014): "drum-corps-an-american-tradition"
		case ("show-of-shows", "Rockford", 2014): "show-of-shows-2"
		case ("show-of-shows", "Metamora", 2014): "show-of-shows"
		default: scoreSlug
		}

		return scoreSlug
	}

	static func isValid(with name: String?)  -> Bool {
		guard let name else { return true }

		return !name.contains("SoundSport") &&
			!name.contains("Battle") &&
			!name.contains("Education") &&
			!name.contains("Virtual") &&
			!name.contains("Rain") &&
			!name.contains("Kickoff") &&
			!name.contains("Mini Corps") &&
			!name.contains("Individual") &&
			!name.contains("Performers Showcase") &&
			!name.contains("BIG, LOUD") &&
			!name.contains("Big, Loud") &&
			!name.contains("After-Party") &&
			!name.contains("Honors") &&
			!name.contains("Street Beat")
	}
}
