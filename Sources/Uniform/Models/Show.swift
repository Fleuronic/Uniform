// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Show

public extension Show {
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

		if let override = nameOverrides.first(
			where: { $0[0] == name && $0[1] == city && $0[2] == String(year) }
		)?.last {
			name = override
		}

		if let override = nameYearOverrides.first(
			where: { $0[0] == name && yearMatches($0[1], year) }
		)?.last {
			name = override
		}

		if let canonical = nameContains.first(
			where: { name.contains($0.0) }
		)?.1 {
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

		return slugReplacements.reduce(name.lowercased()) {
			$0.replacingOccurrences(of: $1.0, with: $1.1)
		}
	}

	static func scoreSlug(for slug: String, in city: String?, year: Int) -> String {
		var scoreSlug = scoreSlugYearOverrides.first { $0[0] == slug && yearMatches($0[1], year) }?.last ?? slug

		if let override = scoreSlugOverrides.first(
			where: { $0[0] == slug && $0[1] == city && $0[2] == String(year) }
		)?.last {
			scoreSlug = override
		}

		return scoreSlug
	}

	static func isValid(with name: String?)  -> Bool {
		guard let name else { return true }

		return !invalid.contains { name.contains($0) }
	}
}

// MARK: -
private extension Show {
	static let nameReplacements = Resource.pairs(from: "show-name-replacements")
	static let names = Resource.map(from: "show-names")
	static let lowercaseWords = Resource.list(from: "show-lowercase-words")
	static let invalid = Resource.list(from: "show-invalid")
	static let nameOverrides = Resource.rows(from: "show-name-overrides")
	static let nameYearOverrides = Resource.rows(from: "show-name-year-overrides")
	static let nameContains = Resource.pairs(from: "show-name-contains")
	static let finalReplacements = Resource.pairs(from: "show-final-replacements")
	static let slugReplacements = Resource.pairs(from: "show-slug-replacements")
	static let scoreSlugOverrides = Resource.rows(from: "show-score-slug-overrides")
	static let scoreSlugYearOverrides = Resource.rows(from: "show-score-slug-year-overrides")

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
