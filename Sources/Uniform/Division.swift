// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Division

public extension Division {
	private static let replacements = Resource.pairs("division-replacements")
	private static let classes = Resource.list("division-classes")
	private static let names = Resource.map("division-names")

	static func name(for record: String) -> String {
		let base = replacements.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
		let classed = classes.contains(base) ? base + " Class" : base
		return names[classed] ?? classed
	}
}
