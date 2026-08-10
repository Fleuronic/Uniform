// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Corps

@testable import Uniform

struct CorpsTests {
	@Test(arguments: ["US Marines", "United States Marine Corps", "Marine Drum & Bugle Corps"])
	func recognizesTheMarinesByKeyword(_ record: String) {
		let info = Corps.info(for: record)
		#expect(info?.0 == "U.S. Marine Drum & Bugle Corps")
		#expect(info?.1 == "Washington, D.C.")
	}

	@Test(arguments: [
		("Blue Knights", "Denver, CO"),
		("Troopers", "Casper, WY"),
		("Madison Scouts", "Madison, WI")
	] as [(String, String)])
	func returnsLocationForKnownCorps(_ pair: (name: String, location: String)) {
		let info = Corps.info(for: pair.name)
		#expect(info?.0 == pair.name)
		#expect(info?.1 == pair.location)
	}

	@Test(arguments: [
		("Hurricanes - Connecticut, CT", "Connecticut Hurricanes", "Connecticut, CT"),
		("MBI - Rockford, IL", "Minnesota Brass", "Rockford, IL"),
		("The Bluecoats - Canton, OH", "Bluecoats", "Canton, OH"),
		("Freelancers Alumni Corps - Sacramento, CA", "Freelancers Alumni", "Sacramento, CA")
	] as [(String, String, String)])
	func splitsNameFromLocationAndCanonicalizesTheName(_ row: (record: String, name: String, location: String)) {
		let info = Corps.info(for: row.record)
		#expect(info?.0 == row.name)
		#expect(info?.1 == row.location)
	}

	@Test func returnsNilWhenThereIsNoLocationOrMapping() {
		#expect(Corps.info(for: "NoLocationRecord") == nil)
	}

	@Test func returnsNilForMalformedMultiDashRecords() {
		#expect(Corps.info(for: "Too - Many - Dashes - Here") == nil)
	}
}
