// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Venue

@testable import Uniform

struct VenueTests {
	@Test func expandsHighSchoolAndDerivesTheStadium() {
		let (name, host) = Venue.info(for: "Springfield HS", at: "111 Test Ave")
		#expect(name == "Springfield High School Stadium")
		#expect(host == "Springfield High School")
	}

	@Test func splitsVenueFromHostOnAt() {
		let (name, host) = Venue.info(for: "North Field at Test College", at: "222 Test Ave")
		#expect(name == "North Field")
		#expect(host == "Test College")
	}

	@Test func mapsAKnownStadiumToItsHost() {
		let (name, host) = Venue.info(for: "Alta High School", at: "333 Test Ave")
		#expect(name == "Alta High School Football Field")
		#expect(host == "Alta High School")
	}
}
