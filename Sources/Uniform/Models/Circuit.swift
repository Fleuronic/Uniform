// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Circuit

public extension Circuit {
	static func circuit(for record: String) -> String {
		let record = replacements.reduce(record.components(separatedBy: "/").first!) {
			$0.replacingOccurrences(of: $1.0, with: $1.1)
		}

		return abbreviations[record] ?? record
	}

	static func record(for record: String, showID: Int?, showNamed show: String?, in city: String?, state: String?, country: String?, year: Int) -> String {
		rules.first { rule in
			(rule.original ?? "") == record &&
				(rule.showID.map { $0 == showID } ?? true) &&
				(rule.show.map { $0 == show } ?? true) &&
				(rule.city.map { $0 == city } ?? true) &&
				(rule.state.map { $0 == state } ?? true) &&
				(rule.country.map { $0 == country } ?? true) &&
				(rule.years?.contains(year) ?? true)
		}?.circuit ?? (record.isEmpty ? "DCI" : record)
	}

	static func name(for abbreviation: String) -> String {
		names[abbreviation] ?? abbreviation
	}

	static func isValid(with record: String?) -> Bool {
		guard let record else { return true }

		return !invalid.contains(record)
	}
}

// MARK: -
private extension Circuit {
	static let replacements = Resource.pairs(from: "circuit-replacements")
	static let abbreviations = Resource.map(from: "circuit-abbreviations")
	static let names = Resource.map(from: "circuit-names")
	static let rules: [Resource.CircuitRule] = Resource.entries(from: "circuit-rules")
	static let invalid = Set(Resource.list(from: "circuit-invalid"))
}
