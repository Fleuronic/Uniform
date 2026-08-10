// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Division

public extension Division {
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
}
