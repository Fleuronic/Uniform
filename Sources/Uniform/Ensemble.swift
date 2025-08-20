import struct DrumKit.Ensemble

public extension Ensemble {
	typealias Info = (String, String?)

	static func info(for record: String) -> Info? {
		let components = record.components(separatedBy: " - ")
		var name = components[0]
			.replacingOccurrences(of: " Performance", with: "")

		name = switch name {
		case "Banner Brass": "Buccaneer Banner Brass"
		case "Black Star DrumLine": "Black Star Drum Line"
		case "High School 57": "Beijing 57 High School"
		case "Sound Wave Sounders FC": "Sound Wave"
		case "Spirit of Sunyvale SoundSport": "Spirit of Sunnyvale"
		default: name
		}

		let ensembles = [
			"& Alumni",
			"Alisal",
			"Band",
			"BKXperience",
			"Black Star Drum Line",
			"Bram Brata Steel Drums",
			"Buccaneer Banner Brass",
			"Central Florida Sounds of Freedom",
			"DrumSpirit",
			"Experience",
			"High School",
			"Lake Erie Sound",
			"Lutheran Vanguard",
			"PHANtastic",
			"RCR Street Club",
			"Rocky Mountain Brassworks",
			"Rosemont King Cobras",
			"Rhythm IN BLUE",
			"Showband",
			"Sound Wave",
			"Sound of Sun Prairie",
			"Sparta Ignite",
			"Spirit of Sunnyvale",
			"The Cavaliers and The Cavaliers Alumni",
			"Troopers & Legacy Corps"
		]

		if ensembles.contains(where: name.contains) {
			let location = components.count > 1 ? components[1] : nil
			return (name, location)
		} else {
			return nil
		}
	}
}
