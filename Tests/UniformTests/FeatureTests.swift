// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Feature

@testable import Uniform

struct FeatureTests {
	@Test(arguments: [
		("SoundSport", "SoundSport Exhibition"),
		("LIVE - Movie Theater Cinecast", "Big, Loud & Live")
	] as [(String, String)])
	func mapsSpecialNamedFeatures(_ pair: (input: String, expected: String)) {
		#expect(Feature.name(for: pair.input) == pair.expected)
	}

	@Test func leavesCanonicalSpecialNamesUnchanged() {
		#expect(Feature.name(for: "SoundSport Exhibition") == "SoundSport Exhibition")
	}

	@Test func returnsNilForNonFeatureRecords() {
		#expect(Feature.name(for: "Santa Clara Vanguard") == nil)
	}
}
