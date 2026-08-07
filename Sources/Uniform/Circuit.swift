// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Circuit

public extension Circuit {
	private static let replacements = Resource.pairs("circuit-replacements")
	private static let abbreviations = Resource.map("circuit-abbreviations")
	private static let names = Resource.map("circuit-names")
	private static let invalid = Set(Resource.list("circuit-invalid"))

	static func circuit(for record: String) -> String {
		let record = replacements.reduce(record.components(separatedBy: "/").first!) {
			$0.replacingOccurrences(of: $1.0, with: $1.1)
		}

		return abbreviations[record] ?? record
	}

	static func name(for abbreviation: String) -> String {
		names[abbreviation] ?? abbreviation
	}

	static func isValid(with record: String?) -> Bool {
		guard let record else { return true }

		return !invalid.contains(record)
	}
}
