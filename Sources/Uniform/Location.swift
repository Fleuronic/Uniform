import struct DrumKit.Location

public extension Location {
	typealias Info = (String, String, String)

	static func info(for record: String) -> Info? {
		if record.contains("Calgary") {
			return ("Calgary", "AB", "Canada")
		} else if record.contains("Sherbrooke") {
			return ("Sherbrooke", "QC", "Canada")
		} else if record.contains("Beijing") {
			return ("Haidian", "Beijing", "China")
		} else if record.contains("Dadizele") {
			return ("Dadizele", "West Flanders", "Belgium")
		} else if record.contains("Arklow") {
			return ("Arklow", "Co. Wicklow", "Ireland")
		} else if record.contains("Barnsley England") {
			return ("Barnsley", "South Yorkshire", "England")
		} else if record.contains("Widnes Cheshire") {
			return ("Widnes", "Cheshire", "England")
		} else if record.contains("Kerkrade") {
			return ("Kerkrade", "Limburg", "Netherlands")
		} else if record.contains("Union City") {
			return ("Union City", "CA", "United States")
		} else if record.contains("Barnsley") {
			return ("Barnsley", "South Yorkshire", "England")
		} else if record.contains("Woking") {
			return ("Woking", "Surrey", "England")
		} else if record.contains("Leicester") {
			return ("Leicester", "Leicestershire", "England")
		}

		switch record {
		case "Washington, D.C.": return ("Washington", "D.C.", "United States")
		default: break
		}

		let components = record.replacingOccurrences(of: ",", with: "").split(separator: " ")
		guard let stateIndex = (components.firstIndex { $0.allSatisfy(\.isUppercase) }) else {
			let components = record.components(separatedBy: ", ")
			return (components[0], components[1], components[2])
		}
		
		var city = components[0..<stateIndex].joined(separator: " ")
		var state = String(components[stateIndex]).uppercased()
		let country = if stateIndex == components.count - 1 {
			"United States"
		} else {
			components[(stateIndex + 1)...].joined(separator: " ")
		}

		city = switch city {
		case "City of Industry": "Diamond Bar"
		case "LaCrosse": "La Crosse"
		case "MIllbrook", "Milbrook": "Millbrook"
		case "Winston Salem": "Winston-Salem"
		default: city
		}

		state = switch state {
		case "DC": "D.C."
		case "ONT": "ON"
		case "QUE", "QU": "QC"
		default: state
		}

		return (city, state, country)
	}
}
