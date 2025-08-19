import struct DrumKit.Ensemble

public extension Ensemble {
	typealias Info = (String, String?)

	static func info(for record: String) -> Info? {
		let components = record.components(separatedBy: " - ")
		var name = components[0]
			.replacingOccurrences(of: " Performance", with: "")

		name = switch name {
		case "Black Star DrumLine": "Black Star Drum Line"
		case "Sound Wave Sounders FC": "Sound Wave"
		default: name
		}

		let ensembles = [
			"Academy",
			"Band",
			"BKXperience",
			"Black Star Drum Line",
			"Bram Brata Steel Drums",
			"Buccaneer Banner Brass",
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
			"Sparta Ignite"
		]

		if ensembles.contains(where: name.contains) {
			let location = components.count > 1 ? components[1] : nil
			return (name, location)
		} else {
			return nil
		}
	}
}
