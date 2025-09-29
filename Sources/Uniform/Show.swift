import struct DrumKit.Show

public extension Show {
	static func name(for record: String, in city: String?, year: Int) -> String {
		var name = record
			.replacingOccurrences(of: "- ", with: "– ")
			.replacingOccurrences(of: "--", with: "–")
			.replacingOccurrences(of: "?", with: "–")
			.replacingOccurrences(of: "'", with: "’")
			.replacingOccurrences(of: "&amp;", with: "&")
			.replacingOccurrences(of: "Brigadiers", with: "Brigadier’s")
			.replacingOccurrences(of: "Drum Along", with: "Drums Along")
			.replacingOccurrences(of: "Games Portland;", with: "Games – Portland")
			.replacingOccurrences(of: "Games Seattle;", with: "Games – Seattle")
			.replacingOccurrences(of: "Jerset", with: "Jersey")
			.replacingOccurrences(of: "LaCrosse", with: "La Crosse")
			.replacingOccurrences(of: "Masters Summer", with: "Masters of the Summer")
			.replacingOccurrences(of: "Mid-Cal", with: "MidCal")
			.replacingOccurrences(of: "Northwest Music Games", with: "Northwest Youth Music Games")
			.replacingOccurrences(of: "SoCal", with: "So Cal")
			.replacingOccurrences(of: "Southeastern Regional", with: "Southeastern Championship")
			.replacingOccurrences(of: "Southwestern Regional", with: "Southwestern Championship")
			.replacingOccurrences(of: "SUMMER MUSIC GAMES", with: "Summer Music Games")
			.replacingOccurrences(of: "Tradition–", with: "Tradition –")
			.components(separatedBy: " @ ").first!
			.components(separatedBy: " presented by ").first!

		name = switch name {
		case "CrownBeat": "CrownBEAT"
		case "DCI Manchester, NH": "DCI New Hampshire"
		case "DCI Masters": "The Masters of the Summer Music Games"
		case "DCI Open Prelims": "DCI Open Class World Championship Prelims"
		case "DCI Open Finals", "DCI Open Class Finals": "DCI Open Class World Championship Finals"
		case "DCI Open Class Prelims": "DCI Open Class World Championship Prelims"
		case "DCI Finals", "DCI World Class Finals": "DCI World Championship Finals"
		case "DCI Prelims", "DCI World Class Prelims": "DCI World Championship Prelims"
		case "DCI Semifinals", "DCI World Class Semi-Finals": "DCI World Championship Semifinals"
		case "DCI Southeastern": "DCI Southeastern Championship"
		case "DCI Southwestern": "DCI Southwestern Championship"
		case "Diablo Valley Classic": "Diablo Valley Classic Pacific Open Class Championship Finals"
		case "Drums Across the Columbia": "Drums Along the Columbia"
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
		default: name
		}

		name = switch (name, year) {
		case ("DCI All Age Class Finals", 2024): "DCI All-Age World Championship"
		case ("Drums Across America", 2019): "Drums Across America – Atlanta"
		case ("Drums of Summer", 2017): "Tour of Champions – Oklahoma"
		case ("DCI Denton", 2017): "DCI North Texas"
		case ("DCI Jupiter", 2017): "DCI South Florida"
		case ("DCI Alabama", 2017): "DCI Southern Alabama"
		case ("Innovations in Brass: Massillon", 2019): "Innovations in Brass: North Canton"
		default: name
		}

		for word in ["in", "on", "the", "with"] {
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

	static func scoreSlug(for slug: String, in year: Int) -> String {
		switch (slug, year) {
		case ("dci-open-class-world-championship-finals", 2022): "open-class-world-championship-finals"
		case ("dci-all-age-world-championship-finals", 2025): "dci-all-age-world-championship"
		case ("drum-corps-an-american-tradition", 2018): "drum-corps-an-america-tradition"
		case ("drum-corps-an-american-tradition-2", 2018): "drum-corps-an-american-tradition"
		case ("tour-of-champions-oklahoma", 2017): "tour-of-champions-oklahoma-presented-by-drums-of-summer"
		case ("dci-on-the-so-cal-coast", _): "dci-on-the-socal-coast"
		default: slug
		}
	}

	static func isValid(with name: String?)  -> Bool {
		guard let name else { return true }

		return !name.contains("SoundSport") &&
			!name.contains("Battle") &&
			!name.contains("Education") &&
			!name.contains("Virtual") &&
			!name.contains("Rain") &&
			!name.contains("Mini Corps")
	}
}
