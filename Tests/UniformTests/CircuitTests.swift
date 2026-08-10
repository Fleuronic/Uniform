// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Circuit

@testable import Uniform

struct CircuitTests {
	@Test(arguments: [
		("DCI Midwest", "DCM"),
		("DCA-Central", "DCA"),
		("", "DCI"),
		("American Legion", "AL")
	] as [(String, String)])
	func resolvesCircuitAbbreviation(_ pair: (record: String, expected: String)) {
		#expect(Circuit.circuit(for: pair.record) == pair.expected)
	}

	@Test func usesOnlyTheTextBeforeASlash() {
		#expect(Circuit.circuit(for: "DCA-Central/Anything") == "DCA")
	}

	@Test func passesUnknownRecordsThrough() {
		#expect(Circuit.circuit(for: "Some Local Circuit") == "Some Local Circuit")
	}

	@Test(arguments: [
		("DCI", "Drum Corps International"),
		("DCA", "Drum Corps Associates"),
		("GSC", "Garden State Circuit")
	] as [(String, String)])
	func expandsAbbreviationToFullName(_ pair: (abbreviation: String, expected: String)) {
		#expect(Circuit.name(for: pair.abbreviation) == pair.expected)
	}

	@Test func returnsUnknownAbbreviationUnchanged() {
		#expect(Circuit.name(for: "ZZZ") == "ZZZ")
	}

	@Test func treatsMissingCircuitAsValid() {
		#expect(Circuit.isValid(with: nil))
	}

	@Test func flagsBlocklistedRecordsInvalid() {
		#expect(!Circuit.isValid(with: "Clinic"))
		#expect(Circuit.isValid(with: "DCI"))
	}
}
