// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Division

public extension Division {
	static func name(forLabel label: String, showNamed show: String?, in circuit: String, abbreviation: String?, city: String?, year: Int) -> String? {
		let resolved = showRules.first { $0.replacesLabel == true && show?.contains($0.show) == true }?.division ?? (
			label.isEmpty
				? showRules.first { $0.replacesLabel != true && show?.contains($0.show) == true }?.division ?? ""
				: record(for: label, in: circuit, city: city, year: year)
		)
		guard !resolved.isEmpty else { return nil }

		let normalized = name(for: resolved)
		if let rule = eraRules.first(where: { rule in
			(rule.circuit.map { $0 == abbreviation } ?? true) &&
				(rule.name.map { $0 == normalized } ?? true) &&
				(rule.prefix.map { resolved.hasPrefix($0) } ?? true) &&
				(rule.years?.contains(year) ?? true)
		}) {
			return rule.division
		}

		return resolved
	}

	static func name(for record: String) -> String {
		let base = replacements.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
		let classed = classes.contains(base) ? base + " Class" : base
		return names[classed] ?? classed
	}
}

// MARK: -
private extension Division {
	static let replacements = Resource.pairs(from: "division-replacements")
	static let classes = Resource.list(from: "division-classes")
	static let names = Resource.map(from: "division-names")
	static let overrides: [Resource.DivisionOverride] = Resource.entries(from: "division-overrides")
	static let showRules: [Resource.DivisionShowRule] = Resource.entries(from: "division-show-rules")
	static let eraRules: [Resource.DivisionEraRule] = Resource.entries(from: "division-era-rules")

	static func record(for record: String, in circuit: String, city: String?, year: Int) -> String {
		overrides.first { override in
			override.original == record &&
				(override.circuit.map { $0 == circuit } ?? true) &&
				(override.city.map { $0 == city } ?? true) &&
				(override.years?.contains(year) ?? true)
		}?.override ?? record
	}
}
