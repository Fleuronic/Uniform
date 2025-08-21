import struct DrumKit.Show

public extension Show {
	static func name(for record: String) -> String {
		var name = record
			.replacingOccurrences(of: "- ", with: "– ")
			.replacingOccurrences(of: "--", with: "–")
			.replacingOccurrences(of: "?", with: "–")
			.replacingOccurrences(of: "'", with: "’")
			.replacingOccurrences(of: "&amp;", with: "&")
			.replacingOccurrences(of: "Games Portland;", with: "Games – Portland")
			.replacingOccurrences(of: "Games Seattle;", with: "Games – Seattle")
			.replacingOccurrences(of: "Jerset", with: "Jersey")
			.replacingOccurrences(of: "Mid-Cal", with: "MidCal")
			.replacingOccurrences(of: "Northwest Music Games", with: "Northwest Youth Music Games")
			.replacingOccurrences(of: "SUMMER MUSIC GAMES", with: "Summer Music Games")
			.replacingOccurrences(of: "Tradition–", with: "Tradition –")
			.components(separatedBy: " @ ").first!
			.components(separatedBy: " presented by ").first!

		name = switch name {
		case "CrownBeat": "CrownBEAT"
		case "DCI All Age Class Finals": "DCI All-Age World Championship"
		case "DCI Masters": "The Masters of the Summer Music Games"
		case "DCI Open Class Finals": "DCI Open Class World Championship Finals"
		case "DCI Open Class Prelims": "DCI Open Class World Championship Prelims"
		case "DCI World Class Finals": "DCI World Championship Finals"
		case "DCI World Class Prelims": "DCI World Championship Prelims"
		case "DCI World Class Semi-Finals": "DCI World Championship Semifinals"
		case "DCI Southeastern": "DCI Southeastern Championship"
		case "DCI Southwestern": "DCI Southwestern Championship"
		case "Drums Across the Columbia": "Drums Along the Columbia"
		case "March On": "March On!"
		case "Nightbeat", "NightBeat": "NightBEAT"
		case "Summer Music Games of Southern Virginia": "Summer Music Games of Southwest Virginia"
		case "Tour Premiere": "Midwest Premiere"
		default: name
		}

		for word in ["in", "on", "the", "with"] {
			name = name.replacingOccurrences(of: " \(word.capitalized) ", with: " \(word) ")
		}

		return name
	}

	static func slug(forShowNamed name: String) -> String? {
		guard isValid(with: name) else { return nil }
		
		return name
			.lowercased()
			.replacingOccurrences(of: ":", with: "")
			.replacingOccurrences(of: "!", with: "")
			.replacingOccurrences(of: ".", with: "")
			.replacingOccurrences(of: " – ", with: " ")
			.replacingOccurrences(of: " ", with: "-")
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
