// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Placement

public extension Placement {
	private static let groupNames = Resource.map("placement-group-names")

	static func groupName(for record: String) -> String {
		groupNames[record] ?? record
	}
}
