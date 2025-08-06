import struct DrumKit.Show

public extension Show {
	static func name(for record: String) -> String {
		var name = record
			.replacingOccurrences(of: " - ", with: " – ")
			.replacingOccurrences(of: "--", with: "–")
			.replacingOccurrences(of: "?", with: "–")
			.replacingOccurrences(of: "'", with: "’")
			.replacingOccurrences(of: "&amp;", with: "&")
			.replacingOccurrences(of: "Jerset", with: "Jersey")
			.replacingOccurrences(of: "Mid-Cal", with: "MidCal")
			.replacingOccurrences(of: "Northwest Music Games", with: "Northwest Youth Music Games")
			.replacingOccurrences(of: "SUMMER MUSIC GAMES;", with: "Summer Music Games")
			.components(separatedBy: " @ ").first!
			.components(separatedBy: " presented by ").first!

		name = switch name {
		case "DCI All Age Class Finals": "DCI All-Age World Championship Finals"
		case "DCI Open Class Finals": "DCI Open Class World Championship Finals"
		case "DCI Open Class Prelims": "DCI Open Class World Championship Prelims"
		case "DCI World Class Finals": "DCI World Class World Championship Finals"
		case "DCI World Class Prelims": "DCI World Class World Championship Prelims"
		case "DCI World Class Semi-Finals": "DCI World Class World Championship Semifinals"
		case "DCI Southeastern": "DCI Southeastern Championship"
		case "DCI Southwestern": "DCI Southwestern Championship"
		case "March On": "March On!"
		case "The Whitewater Classic": "Whitewater Classic"
		default: name
		}

		for word in ["in", "on", "the", "with"] {
			name = name.replacingOccurrences(of: " \(word.capitalized) ", with: " \(word) ")
		}

		return name
	}

	static func isValid(with record: String?)  -> Bool {
		guard let record else { return true }
		
		return !record.contains("SoundSport") &&
			!record.contains("Battle") &&
			!record.contains("Virtual") &&
			!record.contains("Rain") &&
			!record.contains("Mini Corps")
	}
}
