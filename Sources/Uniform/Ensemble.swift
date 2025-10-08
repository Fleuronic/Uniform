import struct DrumKit.Ensemble

public extension Ensemble {
	typealias Info = (String, String?)

	static func info(for record: String) -> Info? {
		let components = record.components(separatedBy: " - ")
		var name = components[0]
			.replacingOccurrences(of: " & Drum Corps", with: "")
			.replacingOccurrences(of: " Performance", with: "")
			.replacingOccurrences(of: " Exhibition", with: "")
			.replacingOccurrences(of: "Community Arts Network", with: "CAN")
			.replacingOccurrences(of: "Union School District", with: "USD")
			.replacingOccurrences(of: "Univ.", with: "University")
			.trimmingCharacters(in: .whitespaces)

		name = switch name {
		case "BANDtastic Honor Band", "BANDtastic Canton Honor Band": "BANDtastic! Honor Band"
		case "Banner Brass": "Buccaneer Banner Brass"
		case "Black Star DrumLine": "Black Star Drum Line"
		case "Fairfield High School Marching b": "Fairfield High School Marching Band"
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
			"Blue Stars Clinic Participants",
			"Bram Brata Steel Drums",
			"Brig Juice Brass",
			"Buccaneer Banner Brass",
			"Central Florida Sounds of Freedom",
			"Charlotte Jansky, Colts",
			"Crossmen & Spirit of Atlanta",
			"DrumSpirit",
			"Drumline",
			"Ensemble",
			"Experience",
			"Flag Line",
			"High School",
			"Jack Greenlee",
			"Jose Estrada, Genesis",
			"Joseph Flynn, Troopers",
			"Joyfull",
			"Kevin Thompson, Genesis",
			"Knights Legacy",
			"Lake Erie Sound",
			"Lutheran Vanguard",
			"Magnificent Brass",
			"Marching",
			"Paul Yoo, Madison Scouts",
			"PHANtastic",
			"Quartet",
			"Quintet",
			"Percussion",
			"RCR Street Club",
			"Rocky Mountain Brassworks",
			"Rosemont King Cobras",
			"Rhythm IN BLUE",
			"Ryan Jacobs, Bluecoats",
			"Sextet",
			"Showband",
			"Sound Wave",
			"Sound of Sun Prairie",
			"Sparta Ignite",
			"Spirit of Sunnyvale",
			"The Cavaliers and The Cavaliers Alumni",
			"Troopers & Legacy Corps",
			"U.S. Marine Silent Drill Platoon",
			"University",
			"Youth"
		]

		if ensembles.contains(where: name.contains) {
			let location = components.count > 1 ? components[1] : nil
			return (name, location)
		} else {
			return nil
		}
	}
}
