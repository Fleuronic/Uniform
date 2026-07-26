// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Division

public extension Division {
	static func name(for record: String) -> String {
		var name = record
			.replacingOccurrences(of: "All Age", with: "All-Age")
			.replacingOccurrences(of: "A Class", with: "Class A")
			.replacingOccurrences(of: "OPen", with: "Open")

		name = [
			"Open", "World", "All-Age", "International", "Junior", "Premier"
		].contains(name) ? name + " Class" : name

		name = switch name {
		case "A", "DCA A": "Class A"
		case "DCA Open", "DCA Open Class", "DCI Open Class": "Open Class"
		case "All-age", "All age", "All age corps", "ALL-AGE", "Senior": "All-Age Class"
		case "ALL - AGE": "All-Age Division"
		case "Minicorps": "Mini-Corps"
		case "I", "DIVISION I", "DIVISION 1": "Division I"
		case "II", "DIVISION II", "DIVISION 2": "Division II"
		case "III", "DIVISION III", "DIVISION 3": "Division III"
		case "II/III", "II & III": "Division II/III"
		case "JUNIOR": "Junior Class"
		case "ASSOCIATE": "Associate Class"
		case "CADET DIVISION": "Cadet Class"
		default: name
		}

		return name
	}
}
