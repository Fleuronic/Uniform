// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Division

@testable import Uniform

// Verifies the JSON-driven Division.name matches the original switch-based logic
// (kept verbatim below as an independent reference) across a broad input corpus.
struct DivisionTests {
	@Test func matchesLegacy() {
		let inputs = [
			"A", "DCA A", "CLASS A", "CORPS CLASS", "A Class",
			"DCA", "DCA Open", "DCA Open Class", "DCI Open Class", "Open CLASS", "DRUM CORPS CLASS",
			"All-age", "All age", "All age corps", "ALL-AGE", "Senior", "Seniors", "SENIOR", "All Age",
			"ALL - AGE", "All-ages", "Division",
			"Minicorps",
			"I", "1", "DIVISION I", "DIVISION 1",
			"II", "2", "DIVISION II", "DIVISION 2",
			"III", "3", "DIVISION III", "DIVISION 3",
			"IV", "4", "DIVISION IV", "DIVISION 4",
			"II/III", "II & III", "II / III", "DIVISION II/III", "Division II / III", "DivisionII/III",
			"JUNIOR", "Juniors", "JUNIOR CLASS",
			"ASSOCIATE",
			"CADET DIVISION", "CADET CLASS", "CADET",
			"Concert", "Parade", "MARCHING PERC CLASS", "US Division II",
			"Open", "World", "All-Age", "International", "Junior", "Premier",
			"OPen", "OPEN",
			"Open Class", "World Class", "Premier Class",
			"Something Unmapped", "", "Division V"
		]

		for input in inputs {
			#expect(Division.name(for: input) == Self.legacyName(for: input), "mismatch for \(input)")
		}
	}

	private static func legacyName(for record: String) -> String {
		var name = record
			.replacingOccurrences(of: "All Age", with: "All-Age")
			.replacingOccurrences(of: "A Class", with: "Class A")
			.replacingOccurrences(of: "OPen", with: "Open")
			.replacingOccurrences(of: "OPEN", with: "Open")

		name = [
			"Open", "World", "All-Age", "International", "Junior", "Premier"
		].contains(name) ? name + " Class" : name

		name = switch name {
		case "A", "DCA A", "CLASS A", "CORPS CLASS": "Class A"
		case "DCA": "All-Age Division"
		case "DCA Open", "DCA Open Class", "DCI Open Class", "Open CLASS", "DRUM CORPS CLASS": "Open Class"
		case "All-age", "All age", "All age corps", "ALL-AGE", "Senior", "Seniors", "SENIOR": "All-Age Class"
		case "ALL - AGE", "All-ages", "Division": "All-Age Division"
		case "Minicorps": "Mini-Corps"
		case "I", "1", "DIVISION I", "DIVISION 1": "Division I"
		case "II", "2", "DIVISION II", "DIVISION 2": "Division II"
		case "III", "3", "DIVISION III", "DIVISION 3": "Division III"
		case "IV", "4", "DIVISION IV", "DIVISION 4": "Division IV"
		case "II/III", "II & III", "II / III", "DIVISION II/III", "Division II / III", "DivisionII/III": "Division II/III"
		case "JUNIOR", "Juniors", "JUNIOR CLASS": "Junior Class"
		case "ASSOCIATE": "Associate Class"
		case "CADET DIVISION", "CADET CLASS", "CADET": "Cadet Class"
		case "Concert": "Concert Class"
		case "Parade": "Parade Class"
		case "MARCHING PERC CLASS": "Percussion Class"
		case "US Division II": "U.S. Division II"
		default: name
		}

		return name
	}
}
