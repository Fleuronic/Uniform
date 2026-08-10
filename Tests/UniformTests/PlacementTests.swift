// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Placement

@testable import Uniform

struct PlacementTests {
	@Test(arguments: [
		("Hurricanes", "Connecticut Hurricanes"),
		("Calgary Stetson Show Band", "Calgary Stetson Showband"),
		("Blue Devils \"B\"", "Blue Devils B")
	] as [(String, String)])
	func normalizesGroupName(_ pair: (input: String, expected: String)) {
		#expect(Placement.groupName(for: pair.input) == pair.expected)
	}

	@Test func passesUnmappedGroupNamesThrough() {
		#expect(Placement.groupName(for: "Blue Devils") == "Blue Devils")
	}
}
