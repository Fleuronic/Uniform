import struct DrumKit.Ensemble

public extension Ensemble {
	typealias Info = (String, String?)

	static func info(for record: String) -> Info? {
		let allComponents = record.components(separatedBy: " - ")
		let components = [allComponents.first!, allComponents.last!]
		var name = components[0]
			.replacingOccurrences(of: " & Drum Corps", with: "")
			.replacingOccurrences(of: " Performance", with: "")
			.replacingOccurrences(of: " Exhibition", with: "")
			.replacingOccurrences(of: "Community Arts Network", with: "CAN")
			.replacingOccurrences(of: "Union School District", with: "USD")
			.replacingOccurrences(of: "School District", with: "USD")
			.replacingOccurrences(of: "Beeches Ensemble", with: "Beeches")
			.replacingOccurrences(of: "Univ.", with: "University")
			.replacingOccurrences(of: "H.S.", with: "High School")
			.replacingOccurrences(of: "Jr/Sr", with: "Jr./Sr.")
			.replacingOccurrences(of: "Brata", with: "Bratá")
			.trimmingCharacters(in: .whitespaces)

		name = switch name {
		case "BANDtastic Honor Band", "BANDtastic Canton Honor Band": "BANDtastic! Honor Band"
		case "Banner Brass": "Buccaneer Banner Brass"
		case "Black Star DrumLine": "Black Star Drum Line"
		case "Columbus Saints Minis": "Saints Minis"
		case "Fairfield High School Marching b": "Fairfield High School Marching Band"
		case "High School 57": "Beijing 57 High School"
		case "Sound Wave Sounders FC": "Sound Wave"
		case "Spirit of Sunyvale SoundSport": "Spirit of Sunnyvale"
		case "EN-CORPS by EN-RICH-MENT": "EN-CORPS"
		case "University of Indianapolis": "University of Indianapolis Marching Band"
		case "University of North Georgia": "University of North Georgia Marching Band"
		default: name
		}

		switch name {
		case "BANDtastic! Honor Band": return (name, "Canton, OH")
		case "Bram Bratá Steel Drums": return (name, "Tri-Cities, WA")
		case "BKXperience": return (name, "Denver, CO")
		case "Columbians Experience": return (name, "Pasco, WA")
		case "Frankton-Lapel Marching Band": return (name, "Anderson, IN")
		case "Rosemont King Cobras": return (name, "Rosemont, IL")
		case "The Force of Winchester": return (name, "Winchester, IN")
		case "The Force of Winchester": return (name, "North Point, Hong Kong")
		case "IPS Combined Marching Band": return (name, "Indianapolis, IN")
		case "Northview Marching Knights": return (name, "Brazil, IN")
		case "Old Guard Fife and Drum Corps": return (name, "Arlington, VA")
		case "INpact Band": return (name, "Indianapolis, IN")
		case "Lutheran Vanguard": return (name, "Appleton, WI")
		case "Minnesota State University Clinic Band": return (name, "Mankato, MN")
		default: break
		}

		let ensembles = [
			" Camp",
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
			"EN-CORPS",
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
			"Saints Minis",
			"Sextet",
			"Showband",
			"Sound Wave",
			"Sound of Sun Prairie",
			"Sparta Ignite",
			"Spirit of Sunnyvale",
			"Stafford Brigades",
			"The Cavaliers and The Cavaliers Alumni",
			"Troopers & Legacy Corps",
			"U.S. Marine Silent Drill Platoon",
			"University",
			"Youth"
		]

		if ensembles.contains(where: name.contains) && !name.contains("Marching Brass") && !name.contains("Marching Elite") {
			let location = components.count > 1 ? components[1] : nil
			return (name, location)
		} else {
			return nil
		}
	}
}
