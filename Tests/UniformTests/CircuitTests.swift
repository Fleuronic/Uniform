// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Circuit

@testable import Uniform

struct CircuitTests {
	@Test func circuitMatchesLegacy() {
		let inputs = [
			"", "DCI Division II & III", "American Legion", "DCA-C", "DCA-Central", "DCA-S",
			"DCI Midwest", "Eastern States Circuit", "DCEurope", "Japan",
			"DCI-Pacific", "DCI-Atlantic", "DCA/DCI", "DCM", "SomethingElse",
			"O'Brien &amp; Sons"
		]

		for input in inputs {
			#expect(Circuit.circuit(for: input) == Self.legacyCircuit(for: input), "circuit mismatch for \(input)")
		}
	}

	@Test func nameMatchesLegacy() {
		let inputs = ["ADCQ", "AL", "DCI", "DCA", "DCM", "FAMQ", "KNFM", "VFW", "Unknown", ""]
		for input in inputs {
			#expect(Circuit.name(for: input) == Self.legacyName(for: input), "name mismatch for \(input)")
		}
	}

	@Test func isValidMatchesLegacy() {
		let inputs: [String?] = [nil, "Clinic", "DCI", "", "Anything"]
		for input in inputs {
			#expect(Circuit.isValid(with: input) == Self.legacyIsValid(with: input))
		}
	}

	private static func legacyCircuit(for record: String) -> String {
		let record = record
			.components(separatedBy: "/").first!
			.replacingOccurrences(of: "'", with: "’")
			.replacingOccurrences(of: "&amp;", with: "&")
			.replacingOccurrences(of: "DCI-", with: "DCI ")

		return switch record {
		case "", "DCI Division II & III": "DCI"
		case "American Legion": "AL"
		case "DCA-C", "DCA-Central", "DCA-S": "DCA"
		case "DCI Midwest": "DCM"
		case "Eastern States Circuit": "ESC"
		case "DCEurope": "DCE"
		case "Japan": "DCJ"
		default: record
		}
	}

	private static func legacyName(for abbreviation: String) -> String {
		switch abbreviation {
		case "ADCQ": "Les Amis du Drum Corps Québécois"
		case "AL": "American Legion"
		case "BYBA": "British Youth Band Association"
		case "CAMQ": "Circuit des associations musicales du Québec"
		case "CBSD": "Christelijke Bond van Show- en Drumbands"
		case "CDCA": "Canadian Drum Corps Association"
		case "DCI": "Drum Corps International"
		case "DCA": "Drum Corps Associates"
		case "DCG": "Drum Corps Germany"
		case "DCE": "Drum Corps Europe"
		case "DCH": "Drum Corps Holland"
		case "IMBA": "Irish Marching Bands Association"
		case "DCJ": "Drum Corps Japan"
		case "DCM": "Drum Corps Midwest"
		case "DCNY": "Drum Corps New York"
		case "DCQ": "Drum Corps Quebec"
		case "DCS": "Drum Corps South"
		case "DCW": "Drum Corps West"
		case "DMG": "Dutch Music Games"
		case "EMass": "Eastern Massachusetts"
		case "ESC": "Eastern States Circuit"
		case "FAMQ": "Fédération des associations musicales du Québec"
		case "GSC": "Garden State Circuit"
		case "ICA": "International Corps Associates"
		case "KNFM": "Koninklijke Nederlandse Federatie van Muziekverenigingen"
		case "MCA": "Mini Corps Associates"
		case "ODCA": "Ontario Drum Corps Association"
		case "VFW": "Veterans of Foreign Wars"
		default: abbreviation
		}
	}

	private static func legacyIsValid(with record: String?) -> Bool {
		guard let record else { return true }

		return switch record {
		case "Clinic": false
		default: true
		}
	}
}
