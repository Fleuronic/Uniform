// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Location

public extension Location {
	typealias Info = (String, String, String)

	private static let containsRules = Resource.rows("location-contains")
	private static let exact = Resource.triples("location-exact")
	private static let cities = Resource.map("location-cities")
	private static let states = Resource.map("location-states")

	static func info(for record: String) -> Info? {
		let record = record.replacingOccurrences(of: "'", with: "’")

		for rule in containsRules where record.contains(rule[0]) {
			return (rule[1], rule[2], rule[3])
		}

		if let info = exact[record] {
			return info
		}

		let components = record.replacingOccurrences(of: ",", with: "").split(separator: " ")
		guard let stateIndex = (components.firstIndex { $0.allSatisfy(\.isUppercase) }) else {
			let components = record.components(separatedBy: ", ")
			return components.count == 3 ? (components[0], components[1], components[2]) : nil
		}

		var city = components[0..<stateIndex].joined(separator: " ")
		var state = String(components[stateIndex]).uppercased()
		let country = if stateIndex == components.count - 1 {
			"United States"
		} else {
			components[(stateIndex + 1)...].joined(separator: " ")
		}

		city = cities[city] ?? city
		state = states[state] ?? state

		return (city, state, country)
	}
}
