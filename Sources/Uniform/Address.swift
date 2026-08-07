// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Address

public extension Address {
	private static let streetReplacements = Resource.pairs("address-street-replacements")

	static func info(for records: [String]) -> (String, String) {
		switch records {
		case ["Apple Valley, MN"]: return ("6200 140th St W", "55124")
		default: break
		}

		let streetAddress = streetReplacements
			.reduce(records[0]) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
			.components(separatedBy: " (").first!
		let zipCode = records[1].components(separatedBy: " ").last!
		return (streetAddress, zipCode)
	}
}
