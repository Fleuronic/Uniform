// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Feature

public extension Feature {
	static func name(for record: String) -> String? {
		if let name = specialNames[record] { return name }

		if presentationKeywords.contains(where: record.contains) {
			return presentationReplacements.reduce(record) {
				$0.replacingOccurrences(of: $1.0, with: $1.1)
			}
		}

		let record = recordReplacements.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }

		guard keywords.contains(where: record.contains) else { return nil }

		let name = replacements
			.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
			.components(separatedBy: " - ")
			.first { keywords.contains(where: $0.contains) }!

		return truncators.reduce(name) { $0.components(separatedBy: $1).first! }
	}
}

// MARK: -
private extension Feature {
	static let specialNames = Resource.map(from: "feature-special")
	static let presentationKeywords = Resource.list(from: "feature-presentation")
	static let presentationReplacements = Resource.pairs(from: "feature-presentation-replacements")
	static let recordReplacements = Resource.pairs(from: "feature-record-replacements")
	static let keywords = Resource.list(from: "feature-keywords")
	static let replacements = Resource.pairs(from: "feature-replacements")
	static let truncators = Resource.list(from: "feature-truncators")
}
