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

	@Test func returnsTheOverrideForAKnownStreetAddress() {
		let (name, host) = Venue.info(for: "Ignored Record", at: "1 Bills Dr")
		#expect(name == "New Era Field")
		#expect(host == nil)
	}

	@Test func canonicalizesVenueNameAndResolvesItsHost() {
		let (name, host) = Venue.info(for: "Salem Stadium", at: "999 Test Ave")
		#expect(name == "Salem Football Stadium")
		#expect(host == "Salem High School")
	}

	@Test func appliesHostFixups() {
		let (name, host) = Venue.info(for: "North Field at Texas A&M", at: "998 Test Ave")
		#expect(name == "North Field")
		#expect(host == "Texas A&M University")
	}
}
