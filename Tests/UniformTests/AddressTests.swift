// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Address

@testable import Uniform

struct AddressTests {
	@Test func matchesLegacy() {
		let inputs: [[String]] = [
			["Apple Valley, MN"],
			["123 Main Street", "Town 55401"],
			["1 Stadium Drive #200", "City AB 90210"],
			["100 Sunset Boulevard", "LA CA 90001"],
			["One Championship Lane", "X 12345"],
			["Lawson Rd", "Y 20001"],
			["Oliver Jackson Blvd (Gate 5)", "Z 30303"],
			["Stanhope Elmore High School", "W 36092"],
			["SW Haverhill Rd", "El Dorado KS 67042"],
			["Millenium Highway Route 66", "Q 44444"],
			["St. Rinehardt Avenue", "R 55555"]
		]

		for input in inputs {
			let new = Address.info(for: input)
			let old = Self.legacyInfo(for: input)
			#expect(new == old, "mismatch for \(input)")
		}
	}

	private static func legacyInfo(for records: [String]) -> (String, String) {
		switch records {
		case ["Apple Valley, MN"]: return ("6200 140th St W", "55124")
		default: break
		}

		let streetReplacements = [
			(".", ""),
			("'", "’"),
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
