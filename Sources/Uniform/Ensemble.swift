import struct DrumKit.Ensemble

public extension Ensemble {
	typealias Info = (String, String?)

	static func info(for record: String) -> Info? {
		let allComponents = record.components(separatedBy: " - ")
		let components = [allComponents.first!, allComponents.last!]
		var name = components[0]
			.replacingOccurrences(of: " & Drum Corps", with: "")
			.replacingOccurrences(of: " Performance", with: "")
			.replacingOccurrences(of: " Joint", with: "")
			.replacingOccurrences(of: " Exhibition", with: "")
			.replacingOccurrences(of: " Band and Colorguard", with: "")
			.replacingOccurrences(of: "Community Arts Network", with: "CAN")
			.replacingOccurrences(of: "Union School District", with: "USD")
			.replacingOccurrences(of: "School District", with: "USD")
			.replacingOccurrences(of: "Beeches Ensemble", with: "Beeches")
			.replacingOccurrences(of: "Univ.", with: "University")
			.replacingOccurrences(of: "H.S.", with: "High School")
			.replacingOccurrences(of: "Jr/Sr", with: "Jr./Sr.")
			.replacingOccurrences(of: "Brata", with: "Bratá")
			.replacingOccurrences(of: "Marching band", with: "Marching Band")
			.trimmingCharacters(in: .whitespaces)

		name = switch name {
		case "Academy Summer Youth Guard": "The Academy Summer Youth Guard"
		case "BANDtastic Honor Band", "BANDtastic Canton Honor Band": "BANDtastic! Honor Band"
		case "Banner Brass": "Buccaneer Banner Brass"
		case "Black Star DrumLine": "Black Star Drum Line"
		case "Columbus Saints Minis": "Saints Minis"
		case "Fairfield High School Marching b": "Fairfield High School Marching Band"
		case "Baby Giant/Hong Kong Drummer Festival Drumline": "HKDrumFest/Baby Giant Drumline"
		case "High School 57": "Beijing 57 High School Marching Band"
		case "Sound Wave Sounders FC": "Sound Wave"
		case "Sound of Sun Prarie": "Sound of Sun Prairie"
		case "The Bluecoats and the Academy": "Bluecoats & The Academy"
		case "Spirit of Sunyvale SoundSport": "Spirit of Sunnyvale"
		case "EN-CORPS by EN-RICH-MENT": "EN-CORPS"
		case "University of Indianapolis": "University of Indianapolis Marching Band"
		case "University of North Georgia": "University of North Georgia Marching Band"
		case "Valley High School": "Valley High School Marching Band"
		case "Oregon High School": "Oregon High School Marching Band"
		case "Xili Primary School": "Xili Primary School Marching Band"
		case "High School Affiliated to BIT": "High School Affiliated to BIT Marching Band"
		default: name
		}

		// IMBA (Irish) & allied UK marching bands are scored as bands, not drum
		// corps. Guard on the record's country so same-named US corps (e.g. the
		// Ravens and Vikings drum corps) keep their corps classification.
		if
			[
				"Ravens",
				"Clonmel Bluehawks",
				"Clondalkin Youth Band",
				"Tallaght Youth Band Cadets",
				"Tallaght Festival Band",
				"Atherstone YMB"
			].contains(name),
			let location = components.count > 1 ? components[1] : nil,
			location.contains("Ireland") || location.contains("United Kingdom") {
			return (name, location)
		}

		switch name {
		case "204th Army Band Jazz Ensemble": return (name, "Fort Snelling, MN")
		case "The Academy Summer Youth Guard": return (name, "Tempe, AZ")
		case "BANDtastic! Honor Band": return (name, "Canton, OH")
		case "Bram Bratá Steel Drums": return (name, "Tri-Cities, WA")
		case "Brig Juice Brass": return (name, "Syracuse, NY")
		case "BKXperience": return (name, "Denver, CO")
		case "Columbians Experience": return (name, "Pasco, WA")
		case "Fairfield High School Marching Band": return (name, "Fairfield, OH")
		case "Frankton-Lapel Marching Band": return (name, "Anderson, IN")
		case "Golden Pride Marching Band": return (name, "Washington, IN")
		case "Joyfull": return (record, "Winston-Salem, NC")
		case "Knights Legacy": return (name, "Geneseo, IL")
		case "Marching Ghosts": return (name, "Calgary, AB")
		case "Memphis Youth Arts Initiative": return (name, "Memphis, TN")
		case "NC A&T University Drumline": return (name, "Greensboro, NC")
		case "Normal Marching Band": return (name, "Normal, IL")
		case "Rosemont King Cobras": return (name, "Rosemont, IL")
		case "The Force of Winchester": return (name, "Winchester, IN")
		case "HKDrumFest/Baby Giant Drumline": return (name, "North Point, Hong Kong")
		case "IPS Combined Marching Band": return (name, "Indianapolis, IN")
		case "Northview Marching Knights": return (name, "Brazil, IN")
		case "Old Guard Fife and Drum Corps": return (name, "Arlington, VA")
		case "INpact Band": return (name, "Indianapolis, IN")
		case "Lutheran Vanguard": return (name, "Appleton, WI")
		case "Lighthouse Brigade of Racine": return ("Lighthouse Brigade", "Racine, WI")
		case "Murphysboro HS Crimson Exp": return ("Murphysboro High School Crimson Express", "Murphysboro, IL")
		case "Strangerettes": return (name, "Dallas, TX")
		case "Minnesota State University Clinic Band": return (name, "Mankato, MN")
		case "U.S. Marine Silent Drill Platoon": return (name, "Washington, D.C.")
		case "Whitehaven High School Drumline": return (name, "Memphis, TN")
		case "Crosstown Big Band": return (name, "Ogden, UT")
		case "Mercedes Marching Band": return (name, "Mercedes Norte, Heredia")
		case "Harpe Davids": return (name, components[1])
		case "Bands of America & Carolina Crown": return (name, nil)
		default: break
		}

		let ensembles = [
			" Camp",
			"& Les",
			"& The",
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
			"Kevin Thompson, Genesis",
			"Knights Legacy",
			"Lake Erie Sound",
			"Lutheran Vanguard",
			"Magnificent Brass",
			"Marching",
			"Orchestra",
			"Paul Yoo, Madison Scouts",
			"PHANtastic",
			"Quartet",
			"Quintet",
			"Percussion",
			"Primary School",
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

		if
			ensembles.contains(where: name.contains) &&
			!name.contains("Marching Brass") &&
			!name.contains("Marching Elite") &&
			!name.contains("Hamilton Youth Performing") &&
			!name.contains("Preston Scout House") &&
			!name.contains("Bandits") {
			let location = components.count > 1 ? components[1] : nil
			return (name, location)
		} else {
			return nil
		}
	}
}
