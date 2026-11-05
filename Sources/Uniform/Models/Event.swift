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

	static func isValid(showID: Int?) -> Bool {
		showID.map { !invalidShowIDs.contains($0) } ?? true
	}
}

// MARK: -
private extension Event {
	static let dateOverrides: [Resource.DateOverride] = Resource.entries(from: "event-date-overrides")
	static let invalidShowIDs: Set<Int> = Set(Resource.entries(from: "event-invalid-show-ids"))
}
