// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Venue

public extension Venue {
	private static let venues = Resource.optionalTuples("venue-info")
	private static let recordReplacements = Resource.pairs("venue-record-replacements")
	private static let names = Resource.map("venue-names")
	private static let hosts = Resource.map("venue-hosts")
	private static let stadiums = Resource.map("venue-stadiums")
	private static let hostFixups = Resource.map("venue-host-fixups")

	static func info(for record: String, at streetAddress: String) -> (String, String?) {
		if let venue = venues[streetAddress] {
			return venue
		}

		var name: String
		var host: String? = nil
		let components = recordReplacements
			.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
			.components(separatedBy: " at ")

		if components.count == 2 {
			name = components[0]
			host = components[1]
		}

		name = components[0]
			.components(separatedBy: "-")[0]
			.replacingOccurrences(of: "HS", with: "High School")
			.replacingOccurrences(of: "High School Stadium", with: "High School")

		name = names[name] ?? name
		host = hosts[name] ?? host

		let stadiumName: String? = stadiums[name] ?? (name.hasSuffix("High School") ? "\(name) Stadium" : nil)

		if let stadiumName {
			host = name
			name = stadiumName
		} else {
			host = host.flatMap { hostFixups[$0] } ?? host
		}

		return (name, host)
	}
}
