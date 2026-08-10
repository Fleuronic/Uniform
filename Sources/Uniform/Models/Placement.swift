// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Placement

public extension Placement {
	static func groupName(for record: String) -> String {
		groupNames[record] ?? record
	}
}

// MARK: -
private extension Placement {
	static let groupNames = Resource.map(from: "placement-group-names")
}
