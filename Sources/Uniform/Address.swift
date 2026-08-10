// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Address

public extension Address {
	private static let overrides = Resource.tuples("address-overrides")
	private static let streetReplacements = Resource.pairs("address-street-replacements")

	static func info(for records: [String]) -> (String, String) {
		if records.count == 1, let info = overrides[records[0]] {
			return info
		}

		let streetAddress = streetReplacements
			.reduce(records[0]) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
			.components(separatedBy: " (").first!
		let zipCode = records[1].components(separatedBy: " ").last!
		return (streetAddress, zipCode)
	}
}
