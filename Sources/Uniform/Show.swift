// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Show

public extension Show {
	static func name(for record: String, in city: String?, year: Int) -> String {
		let nameReplacements = [
			("- ", "– "),
			("--", "–"),
			("?", "–"),
			("'", "’"),
			("… ", "’"),
			("  ", " "),
			(" Corps Show", ""),
			("&amp;", "&"),
			("@ the Glen", "at the Glen"),
			(" 2013", ""),
			(" 2014", ""),
			(" 2015", ""),
			(" 2016", ""),
			(" 2017", ""),
			(" 2018", ""),
			("2013 ", ""),
			("2014 ", ""),
			("2015 ", ""),
			("2016 ", ""),
			("2017 ", ""),
			("2018 ", ""),
			("WDBJ-7 ", ""),
			(" Drum Corps Competition", ""),
			(". Drum", "Drum"),
			("Barnum Festival Champions", "Barnum Festival: Champions"),
			("Innovations in Brass:", "Innovations in Brass –"),
			("Tour of Champions:", "Tour of Champions –"),
			("Brigadiers", "Brigadier’s"),
			("Brigadier’s’", "Brigadier’s"),
			("Drum Along", "Drums Along"),
			("Champions,", "Champions"),
			("Crest San,", "Crest – San"),
			("Crest Los,", "Crest – Los"),
			("Crest Walnut,", "Crest – Walnut"),
			("Games Portland", "Games – Portland"),
			("Games Seattle", "Games – Seattle"),
			("Shows Waukesha", "Shows – Waukesha"),
			("Jerset", "Jersey"),
			("LaCrosse", "La Crosse"),
			("Masters Summer", "Masters of the Summer"),
			("Rhapsody-Metamora", "Rhapsody – Metamora"),
			("Rhapsody-La Crosse", "Rhapsody – La Crosse"),
			("Mid-Cal", "MidCal"),
			("Northwest Music Games", "Northwest Youth Music Games"),
			("Mini Corps", "Mini-Corps"),
			("SoCal", "So Cal"),
			("Southeastern Regional", "Southeastern Championship"),
			("Southwestern Regional", "Southwestern Championship"),
			("SUMMER MUSIC GAMES", "Summer Music Games"),
			("NATIONALS", "Nationals"),
			("Tradition–", "Tradition –"),
			("Tradition, ", "Tradition – "),
			("Texas,", "Texas"),
			("Mississippi River,", "Mississippi"),
			("Love, Drum", "Love, and Drum"),
			("The Marching Millionaires", "Marching Millionaires"),
			("The DCI South", "DCI South"),
			("The Kiltie Klassic", "Kiltie Klassic"),
			(", the 2014 DCI Tour Premiere", ""),
			(" – A DCI/DCA split event!", ""),
			("OST Type keywords’ ", ""),
			("Afternoon Show", "Afternoon"),
			("Afternoon show", "Afternoon"),
			("Evening Show", "Evening"),
			("Evening show", "Evening"),
			("Preliminaries", "Prelims"),
			("Calvacade", "Cavalcade"),
			("Starliet", "Starlite"),
			("The Summer Music Games", "Summer Music Games")
		]

		var name = nameReplacements
			.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
			.replacingOccurrences(of: "^[0-9]+(st|nd|rd|th) Annual ", with: "", options: .regularExpression)
			.components(separatedBy: " @ ").first!
			.components(separatedBy: " presented by ").first!
			.components(separatedBy: " Presents: ").last!

		name = switch name {
		case "CrownBeat": "CrownBEAT"
		case "DCI Manchester, NH": "DCI New Hampshire"
		case "DCI Masters", "the Masters of the Summer Music Games": "The Masters of the Summer Music Games"
		case "DCI Open Finals", "DCI Open Class Finals", "DCI World Championships Open Class Championship Finals", "DCI World Championships Open Class Finals", "Open Class Finals": "DCI Open Class World Championship Finals"
		case "DCI Open Prelims", "DCI Open Class Prelims", "DCI World Championships Open Class Championship Prelims": "DCI Open Class World Championship Prelims"
		case "Open Class Semifinals", "DCI World Championships Open Class Semifinals": "DCI Open Class World Championship Semifinals"
		case "World Class Quarterfinals", "DCI World Championships World Class Quarterfinals": "DCI World Championship Quarterfinals"
		case "DCI World Championships Open Class Quarterfinals": "DCI Open Class World Championship Quarterfinals"
		case "DCI Finals", "DCI World Class Finals", "DCI World Championships World Class Finals", "World Class Finals": "DCI World Championship Finals"
		case "DCI Prelims", "DCI World Class Prelims": "DCI World Championship Prelims"
		case "DCI Semifinals", "DCI World Class Semi-Finals", "World Class Semi-Finals", "DCI World Championships World Class Semifinals": "DCI World Championship Semifinals"
		case "DCI Southeastern", "DCI Atlanta Southeastern Championship": "DCI Southeastern Championship"
		case "DCI Southwestern": "DCI Southwestern Championship"
		case "DCI Sioux City": "DCI Morningside"
		case "Music in Motion – Maryland", "Music in Motion-New Jersey", "Music in Motion – New Jersey", "Music in Motion – Central Jersey": "Music in Motion"
		case "Fanfare 2009": "Fanfare"
		case "March of Champions 2009": "March of Champions"
		case "Music City Metal III – the Southern Drumdown": "Music City Metal"
		case "DCI at Americafest 2009": "DCI at Americafest"
		case "Sound Explosion 2009": "Sound Explosion"
		case "Music on the March 2": "Music on the March"
		case "THUNDER in the DESERT": "Thunder in the Desert"
		case "TIDEWATER Summer Music Games": "Tidewater Summer Music Games"
		case "THE exSIGHTment OF SOUND": "The exSIGHTment of Sound"
		case "Festival of Brass Drum": "Festival of Brass"
		case "DCA World Championships – Prelims", "DCA Prelims", "DCA Championship Prelims": "DCA World Championship Prelims"
		case "DCA Open Class Prelims": "DCA Open Class World Championship Prelims"
		case "DCA Class A Prelims": "DCA Class A World Championship Prelims"
		case "DCA World Championships – Finals", "DCA Finals", "Finals", "DCA Championship Finals", "DCA Class A & Open Class Championships": "DCA World Championship Finals"
		case "Drum Corps United Kingdom Open Prelims": "DCUK Championships – Open Prelims"
		case "Drum Corps United Kingdom Finals": "DCUK Championships – Finals"
		case "Drum Corps Europe Championships Prelims": "European Drum Corps Championships – Prelims"
		case "Drum Corps Europe Championships Finals": "European Drum Corps Championships – Finals"
		case "Mini-Corps/I&E", "Mini-Corps Championships", "I&E and Mini-Corps": "DCA World Championships – Mini-Corps & I&E"
		case "Mini-Corps Competition": "DCA Mini-Corps Championship"
		case "DCA Alumni Spectacular", "Alumni Spectacular": "DCA World Championships – Alumni Spectacular"
		case "Drum Corps in Northern Virginia": "Drums in Northern Virginia"
		case "Drums Across the Columbia": "Drums Along the Columbia"
		case "Drums Along The Mississippi": "Drums Along the Mississippi River"
		case "Drums at the Rose Bowl": "Drum Corps at the Rose Bowl"
		case "Gold Showcase (Drum Corps at the Glen)": "Gold Showcase"
		case "March On": "March On!"
		case "Nightbeat", "NightBeat": "NightBEAT"
		case "Summer Music Games of Southern Virginia": "Summer Music Games of Southwest Virginia"
		case "Tour Premiere": "Midwest Premiere"
		case "Drum Corps: An American Tradition – Metro": "Drum Corps: An American Tradition – Clifton"
		case "iablo Valley Classic Pacific Open Class Championship Finals": "D" + name
		case "The Everett Drum & Bugle": "Everett Drum & Bugle Corps Show"
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
		case ("Drum Corps Competition", 2014): "Greendale Drum Corps Show"
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
		case ("dci-on-the-so-cal-coast", _): "dci-on-the-socal-coast"
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

		return
			!name.contains("Battle") &&
			!name.contains("Education") &&
			!name.contains("Virtual") &&
			!name.contains("Rain") &&
			!name.contains("Kickoff") &&
			!name.contains("Individual") &&
			!name.contains("Performers Showcase") &&
			!name.contains("BIG, LOUD") &&
			!name.contains("Big, Loud") &&
			!name.contains("After-Party") &&
			!name.contains("Honors") &&
			!name.contains("Street Beat") &&
			!name.contains("Bugler")
	}
}
