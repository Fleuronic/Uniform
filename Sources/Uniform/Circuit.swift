// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Circuit

public extension Circuit {
	static func abbreviation(for record: String) -> String {
		let abbreviation = record
			.components(separatedBy: "/").first!
			.replacingOccurrences(of: "'", with: "’")
			.replacingOccurrences(of: "&amp;", with: "&")

		return switch abbreviation {
		case "", "DCI Division II & III": "DCI"
		case "American Legion": "AL"
		case "DCA-C", "DCA-Central", "DCA-S": "DCA"
		case "DCI-Central": "DCI Central"
		case "DCI Midwest": "DCM"
		case "DCI-South": "DCI South"
		case "DCI-Pacific": "DCI Pacific"
		case "Eastern States Circuit": "ESC"
		case "DCEurope": "DCE"
		case "Japan": "DCJ"
		default: abbreviation
		}
	}

	static func name(for abbreviation: String) -> String {
		switch abbreviation {
		case "ADCQ": "Les amis du drum corps québécois"
		case "AL": "American Legion"
		case "BYBA": "British Youth Band Association"
		case "CAMQ": "Circuit des associations musicales du Québec"
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
		case "FAMQ": "Fédération des Associations Musicales du Québec"
		case "GSC": "Garden State Circuit"
		case "ICA": "International Corps Associates"
		case "MCA": "Mini Corps Associates"
		case "ODCA": "Ontario Drum Corps Association"
		case "VFW": "Veterans of Foreign Wars"
		default: abbreviation
		}
	}

	static func abbreviation(forDivisionNamed record: String) -> String? {
		switch record {
		case "DCI Open": "DCI"
		case "DCA Open", "DCA A", "Class A": "DCA"
		default: nil
		}
	}

	static func isValid(with record: String?)  -> Bool {
		guard let record else { return true }

		return switch record {
		case "Clinic": false
		default: true
		}
	}
}
