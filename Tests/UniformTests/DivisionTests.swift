// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Division

@testable import Uniform

struct DivisionTests {
	@Test(arguments: [
		("DIVISION 1", "Division I"),
		("1", "Division I"),
		("DIVISION IV", "Division IV"),
		("II & III", "Division II/III"),
		("SENIOR", "All-Age Class"),
		("Minicorps", "Mini-Corps"),
		("US Division II", "U.S. Division II")
	] as [(String, String)])
	func canonicalizesKnownVariants(_ pair: (input: String, expected: String)) {
		#expect(Division.name(for: pair.input) == pair.expected)
	}

	@Test(arguments: [
		("Open", "Open Class"),
		("OPEN", "Open Class"),
		("All Age", "All-Age Class"),
		("Premier", "Premier Class")
	] as [(String, String)])
	func appendsClassSuffixToBareDivisions(_ pair: (input: String, expected: String)) {
		#expect(Division.name(for: pair.input) == pair.expected)
	}

	@Test(arguments: ["Division I", "Open Class", "All-Age Class", "Mini-Corps"])
	func leavesCanonicalNamesUnchanged(_ name: String) {
		#expect(Division.name(for: name) == name)
	}

	@Test func passesUnmappedRecordsThrough() {
		#expect(Division.name(for: "Nonexistent Division") == "Nonexistent Division")
		#expect(Division.name(for: "") == "")
	}
}
