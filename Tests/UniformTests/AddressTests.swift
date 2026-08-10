// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Address

@testable import Uniform

struct AddressTests {
	@Test func usesTheOverrideForAKnownSingleRecord() {
		let info = Address.info(for: ["Apple Valley, MN"])
		#expect(info.0 == "6200 140th St W")
		#expect(info.1 == "55124")
	}

	@Test func abbreviatesStreetTypesAndStripsParentheticals() {
		let info = Address.info(for: ["123 Main Street (Gate 5)", "Springfield IL 62704"])
		#expect(info.0 == "123 Main St")
		#expect(info.1 == "62704")
	}

	@Test func extractsTheZipAsTheLastWhitespaceComponent() {
		let info = Address.info(for: ["1 Stadium Drive", "City ST 00000"])
		#expect(info.0 == "1 Stadium Dr")
		#expect(info.1 == "00000")
	}
}
