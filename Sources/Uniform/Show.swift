// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Show

public extension Show {
	private static let nameReplacements = Resource.pairs("show-name-replacements")
	private static let names = Resource.map("show-names")
	private static let lowercaseWords = Resource.list("show-lowercase-words")
	private static let invalid = Resource.list("show-invalid")
	private static let nameOverrides = Resource.rows("show-name-overrides")
	private static let nameYearOverrides = Resource.rows("show-name-year-overrides")
	private static let nameContains = Resource.pairs("show-name-contains")
	private static let finalReplacements = Resource.pairs("show-final-replacements")
	private static let scoreSlugOverrides = Resource.rows("show-score-slug-overrides")
	private static let scoreSlugYearOverrides = Resource.rows("show-score-slug-year-overrides")

	static func name(for record: String, in city: String?, year: Int) -> String {
		if record.range(of: "^(DCE|DCG|DCN|DCUK|DMG|IMBA) Contest", options: .regularExpression) != nil {
			return ""
		}

		var name = nameReplacements
			.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
			.replacingOccurrences(of: "^[0-9]+(st|nd|rd|th) Annual ", with: "", options: .regularExpression)
			.replacingOccurrences(of: " (19|20)\\d{2}", with: "", options: .regularExpression)
			.replacingOccurrences(of: "(19|20)\\d{2} ", with: "", options: .regularExpression)
			.components(separatedBy: " @ ").first!
			.components(separatedBy: " presented by ").first!
			.components(separatedBy: " Presents: ").last!

		name = names[name] ?? name

		if let override = nameOverrides.first(where: { $0[0] == name && $0[1] == city && $0[2] == String(year) })?.last {
			name = override
		}

		if let override = nameYearOverrides.first(where: { $0[0] == name && yearMatches($0[1], year) })?.last {
			name = override
		}

		if let canonical = nameContains.first(where: { name.contains($0.0) })?.1 {
			name = canonical
		}

		name = finalReplacements.reduce(name) { $0.replacingOccurrences(of: $1.0, with: $1.1) }

		for word in lowercaseWords {
			name = name.replacingOccurrences(of: " \(word.capitalized) ", with: " \(word) ")
		}

		return name
	}

	static func slug(forShowNamed name: String, in year: Int) -> String? {
		guard isValid(with: name) else { return nil }

		return name
			.lowercased()
			.replacingOccurrences(of: ":", with: "")
			.replacingOccurrences(of: "!", with: "")
			.replacingOccurrences(of: ".", with: "")
			.replacingOccurrences(of: "&", with: "")
			.replacingOccurrences(of: "’", with: "-")
			.replacingOccurrences(of: " – ", with: " ")
			.replacingOccurrences(of: " ", with: "-")
	}

	static func scoreSlug(for slug: String, in city: String?, year: Int) -> String {
		var scoreSlug = scoreSlugYearOverrides.first { $0[0] == slug && yearMatches($0[1], year) }?.last ?? slug

		if let override = scoreSlugOverrides.first(where: { $0[0] == slug && $0[1] == city && $0[2] == String(year) })?.last {
			scoreSlug = override
		}

		return scoreSlug
	}

	static func isValid(with name: String?)  -> Bool {
		guard let name else { return true }

		return !invalid.contains { name.contains($0) }
	}
}

private extension Show {
	// Year spec: "2015" exact, "2014,2015" list, "<2018" open, "2013-2018" closed range.
	static func yearMatches(_ spec: String, _ year: Int) -> Bool {
		if spec.hasPrefix("<") {
			return year < Int(spec.dropFirst())!
		} else if spec.contains(",") {
			return spec.split(separator: ",").compactMap { Int($0) }.contains(year)
		} else if spec.contains("-") {
			let bounds = spec.split(separator: "-").compactMap { Int($0) }
			return year >= bounds[0] && year <= bounds[1]
		} else {
			return Int(spec) == year
		}
	}
}
