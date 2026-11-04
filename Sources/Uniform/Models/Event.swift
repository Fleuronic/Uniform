// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit

@MemberwiseInit(.public)
public struct Event: Equatable, Sendable {
	public let showName: String
}

// MARK: -
public extension Event {
	static func date(for record: String, showID: Int?) -> String {
		dateOverrides.first { $0.showID == showID }?.date ?? record
	}
}

// MARK: -
private extension Event {
	static let dateOverrides: [Resource.DateOverride] = Resource.entries(from: "event-date-overrides")
}
