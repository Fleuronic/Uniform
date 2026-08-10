// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit
import struct DrumKit.Corps

@MemberwiseInit(.public)
public struct Corps: Equatable, Sendable {
	public let name: String
	public let city: String
	public let state: String
	public let country: String
}

// MARK: -
public extension DrumKit.Corps {
	typealias Info = (String, String)

	private static let infoMap = Resource.tuples("corps-info")
	private static let infoKeywords = Resource.tuples("corps-info-keywords")
	private static let nameReplacements = Resource.pairs("corps-name-replacements")
	private static let names = Resource.map("corps-names")

	static func info(for record: String) -> Info? {
		if let info = infoKeywords.first(where: { record.contains($0.key) })?.value {
			return info
		}

		if let info = infoMap[record] {
			return info
		}

		guard
			case let components = record.components(separatedBy: " - "),
			components.count == 2 else { return nil }

		let base = nameReplacements.reduce(components[0]) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
		let location = components[1]
		return (names[base] ?? base, location)
	}
}
