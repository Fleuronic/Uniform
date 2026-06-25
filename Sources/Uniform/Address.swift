// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Address

public extension Address {
	static func info(for records: [String]) -> (String, String) {
		switch records {
		case ["Apple Valley, MN"]: return ("6200 140th St W", "55124")
		default: break
		}

		let streetReplacements = [
			(".", ""),
			("#", ""),
			("Drive", "Dr"),
			("Road", "Rd"),
			("Street", "St"),
			("Avenue", "Ave"),
			("Boulevard", "Blvd"),
			("Lane", "Ln"),
			("Highway", "Hwy"),
			("Route", "Rte"),
			("One ", "1 "),
			("Lawson Rd", "9300 Lawson Rd"),
			("Oliver Jackson Blvd", "2225 Oliver Jackson Blvd"),
			("Millenium", "Millennium"),
			("Rinehardt", "Reinhardt"),
			("Stanhope Elmore High School", "4300 Main St"),
			("SW Haverhill Rd", "400 S Haverhill Rd")
		]

		let streetAddress = streetReplacements
			.reduce(records[0]) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
			.components(separatedBy: " (").first!
		let zipCode = records[1].components(separatedBy: " ").last!
		return (streetAddress, zipCode)
	}
}
