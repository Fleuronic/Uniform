// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Feature

public extension Feature {
	private static let specialNames = Resource.map("feature-special")
	private static let presentationKeywords = Resource.list("feature-presentation")
	private static let presentationReplacements = Resource.pairs("feature-presentation-replacements")
	private static let recordReplacements = Resource.pairs("feature-record-replacements")
	private static let keywords = Resource.list("feature-keywords")
	private static let replacements = Resource.pairs("feature-replacements")

	static func name(for record: String) -> String? {
		if let name = specialNames[record] {
			return name
		}

		if presentationKeywords.contains(where: record.contains) {
			return presentationReplacements.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
		}

		let record = recordReplacements.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }

		guard keywords.contains(where: record.contains) else { return nil }

		return replacements
			.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
			.components(separatedBy: " - ")
			.first { keywords.contains(where: $0.contains) }!
			.components(separatedBy: " (").first!
			.components(separatedBy: " Pres. ").first!
	}

	// Lineup features that signal an event actually awarded scores. Single source of truth for
	// both the recorded-load scores guard and the live "event finished" check.
	static func isPossibleScoreAnnouncement(_ name: String) -> Bool {
		[
			"Scores Announced",
			"Awards Ceremony",
			"Retreat",
			"Age-Out Ceremony"
		].contains(name)
	}
}
