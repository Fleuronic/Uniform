// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Show

@testable import Uniform

struct ShowTests {
	@Test(arguments: ["DCE Contest", "DCG Contest", "IMBA Contest"])
	func dropsCircuitContestPlaceholders(_ record: String) {
		#expect(Show.name(for: record, in: nil, year: 2019).isEmpty)
	}

	@Test(arguments: ["Education", "Virtual Performance", "Rain Delay Show"])
	func flagsBlocklistedRecordsInvalid(_ name: String) {
		#expect(!Show.isValid(with: name))
	}

	@Test func treatsMissingOrOrdinaryNamesAsValid() {
		#expect(Show.isValid(with: nil))
		#expect(Show.isValid(with: "DCI Eastern Classic"))
	}

	@Test func doesNotProduceSlugsForInvalidShows() {
		#expect(Show.slug(forShowNamed: "Education Day", in: 2019) == nil)
	}
}
