// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Venue

public extension Venue {
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

// MARK: -
private extension Venue {
	static let venues = Resource.optionalTuples(from: "venue-info")
	static let recordReplacements = Resource.pairs(from: "venue-record-replacements")
	static let names = Resource.map(from: "venue-names")
	static let hosts = Resource.map(from: "venue-hosts")
	static let stadiums = Resource.map(from: "venue-stadiums")
	static let hostFixups = Resource.map(from: "venue-host-fixups")
}
