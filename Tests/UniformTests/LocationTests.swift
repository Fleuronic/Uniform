// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Location

@testable import Uniform

struct LocationTests {
	@Test func parsesCityStateWithTheDefaultCountry() {
		let info = Location.info(for: "Madison, WI")
		#expect(info?.0 == "Madison")
		#expect(info?.1 == "WI")
		#expect(info?.2 == "United States")
	}

	@Test func normalizesAbbreviatedCityNames() {
		let info = Location.info(for: "Ft. Mill, SC")
		#expect(info?.0 == "Fort Mill")
		#expect(info?.1 == "SC")
	}

	@Test func normalizesStateAbbreviations() {
		#expect(Location.info(for: "Somewhere, DC")?.1 == "D.C.")
	}

	@Test func appliesContainsRulesForKnownPlaces() {
		let info = Location.info(for: "Calgary, AB")
		#expect(info?.0 == "Calgary")
		#expect(info?.1 == "AB")
		#expect(info?.2 == "Canada")
	}

	@Test func usesExactOverrides() {
		let info = Location.info(for: "Washington, D.C.")
		#expect(info?.0 == "Washington")
		#expect(info?.1 == "D.C.")
		#expect(info?.2 == "United States")
	}

	@Test func fallsBackToACommaSeparatedTriple() {
		let info = Location.info(for: "Toronto, Ontario, Canada")
		#expect(info?.0 == "Toronto")
		#expect(info?.1 == "Ontario")
		#expect(info?.2 == "Canada")
	}

	@Test func takesTheCountryFromTokensAfterTheState() {
		let info = Location.info(for: "Tokyo JP Japan")
		#expect(info?.0 == "Tokyo")
		#expect(info?.1 == "JP")
		#expect(info?.2 == "Japan")
	}

	@Test func returnsNilForUnparseableRecords() {
		#expect(Location.info(for: "JustACity") == nil)
	}
}
