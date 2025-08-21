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
		}

		switch record {
		case "Washington, D.C.": return ("Washington", "D.C.", "United States")
		default: break
		}

		guard
			case let components = record.replacingOccurrences(of: ",", with: "").split(separator: " "),
			let stateIndex = (components.firstIndex { $0.allSatisfy(\.isUppercase) }) else { return nil }
		
		var city = components[0..<stateIndex].joined(separator: " ")
		var state = String(components[stateIndex]).uppercased()
		let country = if stateIndex == components.count - 1 {
			"United States"
		} else {
			components[(stateIndex + 1)...].joined(separator: " ")
		}

		state = switch state {
		case "DC": "D.C."
		case "ONT": "ON"
		case "QUE": "QC"
		default: state
		}

		return (city, state, country)
	}
}
